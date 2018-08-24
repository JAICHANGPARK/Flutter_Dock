import 'package:flutter/material.dart';

class FirstScreenTwo extends StatelessWidget {

  final _name_to_show_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Sceen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Enter yout name'),
            controller: _name_to_show_controller,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreenTwo(nameToShow: _name_to_show_controller.text,
                          )));
            },
            child: Text('Go Back'),
          )
        ],
      )),
    );
    // TODO: implement build
  }
}

class SecondScreenTwo extends StatelessWidget {
  String nameToShow;

  SecondScreenTwo({Key key,
    @required this.nameToShow}) : super(key: key);

//  final _name_to_show_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Sceen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Hello  $nameToShow'),
//          TextField(
//            decoration: InputDecoration(hintText: 'Enter yout name'),
//            controller: _name_to_show_controller,
//          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
          )
        ],
      )),
    );
    // TODO: implement build
  }
}
