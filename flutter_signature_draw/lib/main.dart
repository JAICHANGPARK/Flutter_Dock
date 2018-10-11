import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Offset> _point = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text("SIGNATURE DRAW"),
//      ),
      body: new Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails detail){
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition = object.globalToLocal(detail.globalPosition);
              _point = new List.from(_point)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _point.add(null),
          child: new CustomPaint(painter: new Signature(
            points: _point
          ),
          size: Size.infinite,),
        ),


      ),
//      body: new Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: new Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//
//          ],
//        ),
//      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _point.clear();
        },
        tooltip: 'Increment',
        child: new Icon(Icons.clear),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.points != points;
  }
}
