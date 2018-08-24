import 'package:flutter/material.dart';

class Phase2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(title: 'My App Hello world', home: ClickMyApp());
  }
}

class ClickMyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeText();
}

class ChangeText extends State<ClickMyApp> {
  String defaultText = 'Hello ! Click me to change content';
  final myController = TextEditingController();
  final myGlobalController = GlobalKey<FormState>();

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
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  void sayHello() {
    if (myGlobalController.currentState.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Hello ' + myController.text),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Form(
        key: myGlobalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) return "Please enter yout name";
              },
              controller: myController,
              decoration: InputDecoration(hintText: 'Enter your name '),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: sayHello,
                  child: Text('Say hi'),
                ))
          ],
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
