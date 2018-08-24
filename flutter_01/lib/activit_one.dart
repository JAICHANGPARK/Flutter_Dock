import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Sceen"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          //TODO 화면 이동
          Navigator.push(context, MaterialPageRoute(builder:
          (context) => SecondScreen()));

        }, child: Text("Start New Screen"),),
      ),
    );
    // TODO: implement build
  }

}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Sceen"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Go Back"),),
      ),
    );
    // TODO: implement build
  }

}