import 'package:flutter/material.dart';


class NewPageOne extends StatelessWidget{

  final String title;
  NewPageOne(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text(title),),
      body: new Center(
        child: Text(title),
      ),
    );
  }

}