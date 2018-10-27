import 'dart:convert';

import 'package:flutter/material.dart';
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

  String url = "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes";
  GOT got;
  String responseBody;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEpisodes();

  }

  fetchEpisodes() async{

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

    return got == null ? Center(
      child: CircularProgressIndicator(),
    )
        : myCard();
  }

  Widget myCard(){
    
    return Card(
      child: Column(
        
        children: <Widget>[
          
          CircleAvatar(
            radius: 100.0,
            backgroundImage: NetworkImage(got.image.original),
          ),
          Text(
            got.name
          ),
          Text(
            got.runtime.toString()
          ),
          Text(
            got.summary
          )
        ],
      ),
    );

  }


}

