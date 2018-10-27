import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_game_of_thrones/episode_page.dart';
import 'package:flutter_game_of_thrones/got.dart';

import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget> {
  String url =
      "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes";
  GOT got;
  String responseBody;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEpisodes();
  }

  fetchEpisodes() async {
    var res = await http.get(url);
    var decodeRes = jsonDecode(res.body);
    print(decodeRes);
    got = GOT.fromJson(decodeRes);
    setState(() {
//      responseBody = decodeRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Of Thrones"),
      ),
      body: myBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget myBody() {
//    return Container(
//      child: responseBody != null ? Text(responseBody) : Text("djflksfj"),
//      color: Colors.green,
//    );

//  return got == null ? Center(
//    child: CircularProgressIndicator(),
//  )
//      : Container(
//    child: Text(" Data is arrived"),
//  );
//  }

    return got == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : myCard();
  }

  Widget myCard() {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(got.image.original),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                got.name,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Runtime : ${got.runtime.toString()} minutes",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(got.summary),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EpisodesPage(

                        episodes: got.eEmbedded.episodes,
                        myImage:  got.image,

                      )));
                },
                child: Text(
                  "All Episodes",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
