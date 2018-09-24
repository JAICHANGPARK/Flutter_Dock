import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_ble101/widgets.dart';

class DetailScreen extends StatefulWidget {
  BluetoothDevice device;

  DetailScreen(this.device);

  @override
  State<StatefulWidget> createState() => DetailScreenState(device);
}

class DetailScreenState extends State<DetailScreen> {
  DetailScreenState(this.device);

  FlutterBlue _flutterBlue = FlutterBlue.instance;

  /// Scanning
  StreamSubscription _scanSubscription;
  Map<DeviceIdentifier, ScanResult> scanResults = new Map();
  bool isScanning = false;

  /// State
  StreamSubscription _stateSubscription;
  BluetoothState state = BluetoothState.unknown;

  /// Device
  BluetoothDevice device;

  bool get isConnected => (device != null);
  StreamSubscription deviceConnection;
  StreamSubscription deviceStateSubscription;
  List<BluetoothService> services = new List();
  Map<Guid, StreamSubscription> valueChangedSubscriptions = {};
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  static final TextEditingController myControllers = new TextEditingController();

  static List<int> mySendValue = new List();


  @override
  void initState() {
    // TODO: implem device
    print(device.id);
    print(device.name);
    _connect(device);
    super.initState();
  }

  static _handleSubmission(String text) {
// Not triggered when you press enter on keyboard in  android simulator
// Triggers if you tap on the Done button.
    mySendValue.clear();
    print(text.length);
    for (int i = 0; i<text.length; i++){
      print(text[i]);
      mySendValue.add(text[i].codeUnitAt(0));
    }

  }

  Widget inputEditText = new Padding(
    padding: EdgeInsets.all(16.0),
    child: new TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          hintText: "input Text"),
      controller: myControllers,
      onEditingComplete: () {
        print(myControllers.text);
      },
      onSubmitted: _handleSubmission,
    ),
  );

  @override
  Widget build(BuildContext context) {
    var tiles = new List<Widget>();

    tiles.add(_buildDeviceStateTile());
    tiles.add(inputEditText);
    tiles.addAll(_buildServiceTiles());

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Device"),
        backgroundColor: Colors.amber,
      ),
      body: new ListView(
        children: tiles,
      ),
    );
  }

  _refreshDeviceState(BluetoothDevice d) async {
    var state = await d.state;
    setState(() {
      deviceState = state;
      print('State refreshed: $deviceState');
      if (deviceState == BluetoothDeviceState.disconnected) {
        _connect(d);
      }
    });
  }

  _buildDeviceStateTile() {
    return new ListTile(
        leading: (deviceState == BluetoothDeviceState.connected)
            ? const Icon(Icons.bluetooth_connected)
            : const Icon(Icons.bluetooth_disabled),
        title: new Text('Device is ${deviceState.toString().split('.')[1]}.'),
        subtitle: new Text('${device.id}'),
        trailing: new IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => _refreshDeviceState(device),
          color: Theme.of(context).iconTheme.color.withOpacity(0.5),
        ));
  }

  _connect(BluetoothDevice d) async {
    device = d;
    // Connect to device
    deviceConnection = _flutterBlue
        .connect(device, timeout: const Duration(seconds: 4))
        .listen(
          null,
          onDone: _disconnect,
        );

    // Update the connection state immediately
    device.state.then((s) {
      setState(() {
        deviceState = s;
        print(deviceState);
      });
    });

    // Subscribe to connection changes
    deviceStateSubscription = device.onStateChanged().listen((s) {
      setState(() {
        deviceState = s;
        print(deviceState);
      });
      if (s == BluetoothDeviceState.connected) {
        device.discoverServices().then((s) {
          setState(() {
            services = s;
          });
        });
      }
    });
  }

  _disconnect() {
    // Remove all value changed listeners
    valueChangedSubscriptions.forEach((uuid, sub) => sub.cancel());
    valueChangedSubscriptions.clear();
    deviceStateSubscription?.cancel();
    deviceStateSubscription = null;
    deviceConnection?.cancel();
    deviceConnection = null;
    setState(() {
      device = null;
    });
  }

  _readDescriptor(BluetoothDescriptor d) async {
    await device.readDescriptor(d);
    setState(() {});
  }

  _writeDescriptor(BluetoothDescriptor d) async {
    await device.writeDescriptor(d, [0x12, 0x34]);
    setState(() {});
  }

  List<Widget> _buildServiceTiles() {
    return services
        .map((s) => new ServiceTile(
              service: s,
              characteristicTiles: s.characteristics
                  .map((c) => new CharacteristicTile(
                        characteristic: c,
                        onReadPressed: () async {
                          List<int> received =
                              await device.readCharacteristic(c);
                          setState(() {
                            BluetoothCharacteristic tmp = c;

                            print('char -->  $c');
                            print(c.uuid);

//          for(int i = 0; i < received.length ; i++){
//            print(received[i]);
//          }
                          });
                        },
                        onWritePressed: () async {
                          await device.writeCharacteristic(c, mySendValue, type: CharacteristicWriteType.withResponse);
                          setState(() {});
                        },
                        onNotificationPressed: () async {
                          print(c.uuid);
                          if (c.isNotifying) {
                            await device.setNotifyValue(c, false);
                            // Cancel subscription
                            valueChangedSubscriptions[c.uuid]?.cancel();
                            valueChangedSubscriptions.remove(c.uuid);
                          } else {
                            await device.setNotifyValue(c, true);
                            // ignore: cancel_subscriptions
                            final sub = device.onValueChanged(c).listen((d) {
                              setState(() {
                                print('onValueChanged $d');
                              });
                            });
                            // Add to map
                            valueChangedSubscriptions[c.uuid] = sub;
                          }
                          setState(() {});
                        },
                        descriptorTiles: c.descriptors
                            .map((d) => new DescriptorTile(
                                  descriptor: d,
                                  onReadPressed: () => _readDescriptor,
                                  onWritePressed: () => _writeDescriptor,
                                ))
                            .toList(),
                      ))
                  .toList(),
            ))
        .toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _stateSubscription?.cancel();
    _stateSubscription = null;
    _scanSubscription?.cancel();
    _scanSubscription = null;
    deviceConnection?.cancel();
    deviceConnection = null;

    _disconnect();
    super.dispose();
  }
}
