import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_mode/cellular.dart';
import 'package:flutter_dark_mode/colors.dart';
import 'package:flutter_dark_mode/group.dart';
import 'package:flutter_dark_mode/header.dart';
import 'package:flutter_dark_mode/items.dart';

class SettingPage extends StatelessWidget {
  static CupertinoPageRoute<void> route() =>
      new CupertinoPageRoute(
        title: 'Cellular',
        builder: (BuildContext context) => SettingPage(),
      );

  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(

      title: "Setting ",
      home: settingsWidget(),


    );
  }
}

class settingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CupertinoPageScaffold(

      child: Container(
        color: backgroundGray,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Setting"),
            ),
            SliverSafeArea(
                top: false,
                sliver: SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      SettingsGroup(<Widget>[
                        SettingsHeader(),
                      ]),

                      SettingsGroup(
                          <Widget>[
                            SettingsItem(
                              label: "Dark Mode",
                              iconAssetLabel: 'airplane',
                              type: SettingsItemType.toggle,
                            ),
                            SettingsItem(
                              label: 'Wi-Fi',
                              iconAssetLabel: 'wifi',
                              type: SettingsItemType.modal,
                              value: 'Airport Free',
                              hasDetails: true,
                            ),
                            SettingsItem(
                              label: 'Bluetooth',
                              iconAssetLabel: 'bluetooth',
                              type: SettingsItemType.modal,
                              value: 'On',
                              hasDetails: true,
                            ),
                            SettingsItem(
                              label: 'Cellular',
                              iconAssetLabel: 'cellular',
                              type: SettingsItemType.modal,
                              onPress: () => Navigator.push(context, CellularPage.route()),
                              hasDetails: true,
                            ),
                            SettingsItem(
                              label: 'Personal Hotspot',
                              iconAssetLabel: 'hotspot',
                              type: SettingsItemType.modal,
                              value: 'Off',
                              hasDetails: true,
                            ),
                            SettingsItem(
                              label: 'VPN',
                              iconAssetLabel: 'vpn',
                              type: SettingsItemType.modal,
                              value: 'Not Connected',
                              hasDetails: true,
                            ),
                          ]


                      ),

                    ]))),
          ],
        ),
      ),
    );
  }
}

