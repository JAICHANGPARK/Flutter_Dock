import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Camera',
      theme: new ThemeData(

        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        appBar: AppBar(title: Text("Flutter Camera"),
        ),
        body: new Center(
          child: _image == null ? new Text('No Image Seleceted') : new Image
              .file(_image),

        ),
        floatingActionButton: FloatingActionButton(onPressed: getImage,tooltip: 'Pick Image',
          child: new Icon(Icons.camera),),
      ),
//      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


