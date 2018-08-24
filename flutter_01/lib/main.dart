import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'My App Hello world',
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter App')),
          body: Center(
            child: new Text(
              'Hello world',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ));
  }
}
