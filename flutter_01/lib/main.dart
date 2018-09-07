import 'package:flutter/material.dart';
import 'package:flutter_01/ch10_sharedPreferences.dart';
import 'package:flutter_01/ch11_file_write.dart';
import 'package:flutter_01/ch12_json_basic.dart';
import 'package:flutter_01/handleTaponWidgets.dart';
import 'package:flutter_01/phase2.dart';
import 'package:flutter_01/simplecalculator.dart';

import 'package:flutter_01/activit_one.dart';
import 'package:flutter_01/activity_interface_0.dart';



//void main() => runApp(
//  MaterialApp(
//    home: new FirstScreenTwo(),
//  )
//
//
//);

//void main() => runApp(HandleTapOnWidgets());

//void main() => runApp(MySharedPreferences());

//void main() => runApp(Ch11FileWrite());

void main() => runApp(MyJsonBasic());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(title: 'My App Hello world',
        home: ClickMyApp());
  }


}

class ClickMyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeText();
}

class ChangeText extends State<ClickMyApp> {
  String defaultText = 'Hello ! Click me to change content';

  int i = 0;

  void changeText() {
    setState(() {
      i++;
      defaultText = "Clicked : " + i.toString();
//      if (i % 2 == 0) {
//        defaultText = 'Text hasbeen changed';
//      } else {
//        defaultText = 'Hello! click me to change content';
//      }
//      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Center(
        child: new Text(
          defaultText,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeText,
        tooltip: 'Click Me',
        child: Icon(Icons.mouse),
      ),
    );
  }
}
