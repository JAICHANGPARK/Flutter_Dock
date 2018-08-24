import 'package:flutter/material.dart';

class Phase2 extends StatelessWidget {
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

  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  void sayHello(){
    showDialog(context: context, builder: (context){
      return AlertDialog(content:
      Text('Hello ' + myController.text),);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: TextField(
        controller: myController,
          decoration: InputDecoration(
            hintText: 'Enter your name'
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sayHello,
        tooltip: 'Click Me',
        child: Icon(Icons.mouse),
      ),
    );
  }
}

