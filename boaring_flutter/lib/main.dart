import 'package:flutter/material.dart';
import 'src/article.dart';

import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _article = articles;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: _article.map(_buildItem).toList(),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(Article e) {
//    if(e.text.startsWith("Data")) return new Text(null);
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new ExpansionTile(
        title: new Text(
          e.text,
          style: new TextStyle(fontSize: 24.0),
        ),

        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("${e.commentsCount} comments"),
              new IconButton(
                icon: new Icon(Icons.launch),
                color: Colors.green,
                onPressed: () async {
                  final fakeUrl = "http://${e.domain}";
                  if (await canLaunch(fakeUrl)) {
                    launch(fakeUrl);
                  }
                },
//                child: new Text("OPEN"),
              ),
            ],
          ),
        ],

//        onTap: () async {
//          final fakeUrl = "http://${e.domain}";
//          if (await canLaunch(fakeUrl)) {
//            launch(fakeUrl);
//          }
//        },
      ),
    );
  }
}
