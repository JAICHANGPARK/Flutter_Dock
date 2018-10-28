import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  Animation cardAnimation, delayedCardAnimation, fabButtonAnim, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    fabButtonAnim = Tween(begin: 0.0, end: -0.05).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.8, -0.0008, curve: Curves.fastOutSlowIn)));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, -0.0008, curve: Curves.fastOutSlowIn)));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {}),
            title: new Text(
              "Near by",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      child: Container(
                        width: 260.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, delayedCardAnimation.value * devHeight, 0.0),
                        width: 280.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
//          body: new Center(
//
//            child: new Column(
//
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                new Text(
//                  'You have pushed the button this many times:',
//                ),
//                new Text(
//                  '$_counter',
//                  style: Theme.of(context).textTheme.display1,
//                ),
//              ],
//            ),
//          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
