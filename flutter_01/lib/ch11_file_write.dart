import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MyStorage {
  //저장소 위치를 가져온다.
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // 저장소에서 파일을 읽어온다.
  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/dreamwalker.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "null";
    }
  }

  Future<File> writeContent(String content) async {
    final file = await localFile;
    return file.writeAsString('$content');
  }
}

class Ch11FileWrite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'Handle Tap On Widgets',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(storage: MyStorage()));
  }
}

class MyHomePage extends StatefulWidget {
  final MyStorage storage;

  MyHomePage({Key key, this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DisplayLayout();
}

class DisplayLayout extends State<MyHomePage> {
  final controller_text_data = TextEditingController();

  final _controller_key = TextEditingController();
  final _controller_data = TextEditingController();

  String text_to_show = " ";

  String text_read = "";

  Future<File> saveToFile() async {
    setState(() {
      text_read = controller_text_data.text;
    });
    return widget.storage.writeContent(text_read);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.storage.readContent().then((String value) {
      setState(() {
        text_read = value;
      });
    });
  }

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
            controller: controller_text_data,
            decoration: InputDecoration(hintText: 'Enter Data'),
          ),
//          TextField(
//            controller: _controller_data,
//            decoration: InputDecoration(hintText: 'Enter Data'),
//          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    saveToFile();
                  },
                  child: Text('Save Data'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    readFile();
                  },
                  child: Text('Read Data'),
                ),
              ),
            ],
          ),
          Text('$text_read'),
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

  void readFile() {
    widget.storage.readContent().then((String value) {
      setState(() {
        text_read = value;
      });
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
