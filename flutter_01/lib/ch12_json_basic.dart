import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userID'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class MyJsonBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'JSON BASIC',
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
          title: Text('Json BASIC'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.body);
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              }

              return CircularProgressIndicator();
            },
            future: fetchPost(),
          ),
        ));
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
