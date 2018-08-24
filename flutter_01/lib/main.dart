import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

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
      if (i % 2 == 0) {
        defaultText = 'Text hasbeen changed';
      } else {
        defaultText = 'Hello! click me to change content';
      }
      i++;
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
