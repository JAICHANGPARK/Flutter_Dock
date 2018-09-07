import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';



class HandleTapOnWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'Handle Tap On Widgets',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyPage());
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('On Tap Demo')),
        body: Center(
      child: CreateButton(),
    ),
    );
    // TODO: implement build
  }
}

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(8.0),
          child: RaisedButton(onPressed: () {

            Fluttertoast.showToast(msg: 'Click Event fire',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            bgcolor: '#333639',
            textcolor: '#ffffff');
          },
            child: Text('On Click'),
          ),
        ),

        Padding(padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {

              Fluttertoast.showToast(msg: 'Single Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#000000',
                  textcolor: '#ffffff');

            },
            onDoubleTap: () {
              Fluttertoast.showToast(msg: 'Double Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#c51162',
                  textcolor: '#ffffff');

            },
            child: Container(padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .buttonColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text('Tap Here'),
            ),
          ),
        )


      ],
    );
  }


}

//
//class ChangeText extends State<ClickMyApp> {
//  String defaultText = 'Hello ! Click me to change content';
//
//  int i = 0;
//
//  void changeText() {
//    setState(() {
//      i++;
//      defaultText = "Clicked : " + i.toString();
////      if (i % 2 == 0) {
////        defaultText = 'Text hasbeen changed';
////      } else {
////        defaultText = 'Hello! click me to change content';
////      }
////      i++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(title: Text('Flutter App')),
//      body: Center(
//        child: new Text(
//          defaultText,
//          style: new TextStyle(
//            fontWeight: FontWeight.bold,
//            color: Colors.blue,
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: changeText,
//        tooltip: 'Click Me',
//        child: Icon(Icons.mouse),
//      ),
//    );
//  }
//}
