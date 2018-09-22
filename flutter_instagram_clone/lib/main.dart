import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/insta_home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Instagram',
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black)),
        textTheme: TextTheme(title: TextStyle(color: Colors.black, fontFamily: "Aveny"),)
      ),
      debugShowCheckedModeBanner: false,
      home: new InstaHome(),

    );
  }
}



