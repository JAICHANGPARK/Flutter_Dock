import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'Handle Tap On Widgets',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DisplayLayout();
}

class DisplayLayout extends State<MyHomePage> {
  final _controller_key = TextEditingController();
  final _controller_data = TextEditingController();

  String text_to_show = " ";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('shared Preferences'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller_key,
            decoration: InputDecoration(hintText: 'Enter Key'),
          ),
          TextField(
            controller: _controller_data,
            decoration: InputDecoration(hintText: 'Enter Data'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => saveData(_controller_key.text, _controller_data.text),
                  child: Text('Save Data'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => readData(_controller_key.text, _controller_data.text),
                  child: Text('Read Data'),
                ),
              ),
            ],
          ),
          Text('$text_to_show'),
        ],
      ),
    );
  }

  saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
    Fluttertoast.showToast(msg: 'Saved data', toastLength: Toast.LENGTH_SHORT);

  }

  readData(String key, String value) async {

    final prefs = await SharedPreferences.getInstance();

    setState(() {
      text_to_show = prefs.getString(key);
    });

  }

}



class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'Click Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#333639',
                  textcolor: '#ffffff');
            },
            child: Text('On Click'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: 'Single Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#000000',
                  textcolor: '#ffffff');
            },
            onDoubleTap: () {
              Fluttertoast.showToast(
                  msg: 'Double Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#c51162',
                  textcolor: '#ffffff');
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
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
