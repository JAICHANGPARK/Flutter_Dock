import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DetailScreen extends StatefulWidget{
  BluetoothDevice device;
  DetailScreen(this.device);

  @override
  State<StatefulWidget> createState() => DetailScreenState(device);
}

class DetailScreenState extends State<DetailScreen>{
  BluetoothDevice d;
  DetailScreenState(this.d);

  @override
  void initState() {
    // TODO: implem device
    print(d.id);
    print(d.name);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Detail Device"),
      backgroundColor: Colors.amber,),
    );
  }



}