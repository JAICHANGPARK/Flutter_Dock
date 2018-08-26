import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Image",
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Sceen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Image From Asset",
                style: TextStyle(
                    inherit: true,
                    color: Colors.blue,
                    fontSize: 20.0)
            ),
            
            Image.network("data:image/png;base64,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")
          ],
//          child: RaisedButton(onPressed: () {
//            //TODO 화면 이동
//
//          }, child: Text("Start New Screen"),),
        ),
      ),
    );
    // TODO: implement build
  }
}
