import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: 'Flutter Calendar'),
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
  var selectDate;

  void handleNewDate(date) {
    setState(() {
      selectDate = date.toString();
    });

    print("handleNewDate ${date}");
  }

  Widget expandCalendar = Calendar(
    onSelectedRangeChange: (range) =>
        print("Range is ${range.item1}, ${range.item2}"),
    isExpandable: true,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Calendar(
//              onSelectedRangeChange: (range) =>
//                  print("Range is ${range.item1}, ${range.item2}"),
              onDateSelected: (date) => handleNewDate(date),
              showChevronsToChangeRange: false,
            ),
            Divider(
              height: 50.0,
            ),
            new Text(
              selectDate != null ? selectDate : "",
              textAlign: TextAlign.center,
            ),
            
          ],
//
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
