import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_reader_news/model/model.dart';
import 'package:http/http.dart' as http;

String API_KEY = "26177c7ba8a54b4b9c46981f1b53a11d";

Future<List<Source>> fetchNewsSource() async {
  final response =
      await http.get('https://newsapi.org/v2/sources?apiKey=${API_KEY}');

  if (response.statusCode == 200) {
    List sources = json.decode(response.body)['sources'];

    return sources.map((source) => new Source.fromJson(source)).toList();
  } else {
    throw Exception('Failed to load source list');
  }
}

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var list_sources;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshListSource();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text("NEWS READER"),
          ),
          body: Center(
            child: RefreshIndicator(
                key: refreshKey,
                child: FutureBuilder<List<Source>>(
                  future: list_sources,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      Text('Error : ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Source> sources = snapshot.data;
                      return new ListView(
                        children: sources
                            .map((source) => GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    elevation: 1.0,
                                    color: Colors.white,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 14.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(

                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2.0, vertical: 8.0),
                                          width: 100.0,
                                          height: 140.0,
                                          child: Image.asset("assets/newspaper.png"),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: const EdgeInsets.only(left:8.0, top: 20.0, bottom: 10.0),
                                                      child: Text('${source.name}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(left:8.0, top:5.0, bottom: 5.0),
                                                child: Text('${source.description}', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.grey),
                                                ),
                                              ),

                                              Container(
                                                margin: const EdgeInsets.only(left:8.0, top: 5.0, bottom: 5.0),
                                                child: Text('Category : ${source.category}', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                                ),
                                              )

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                onRefresh: refreshListSource),
          ),
        ));
  }

  Future<Null> refreshListSource() async {
    refreshKey.currentState?.show(atTop: false);

    setState(() {
      list_sources = fetchNewsSource();
    });

    return null;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
