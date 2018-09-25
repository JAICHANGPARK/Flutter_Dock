import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_action_button/page_one.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage(),
    debugShowCheckedModeBanner: false,
  routes: <String, WidgetBuilder>{

    "/a" : (BuildContext context) => new NewPageOne("Page One"),

  },));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _angle = 90;
  bool _isRotated = true;

  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  Animation<double> _animation3;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );

    _animation2 = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.linear),
    );

    _animation3 = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.8, 1.0, curve: Curves.linear),
    );
    _controller.reverse();
    super.initState();
  }

  void _rotate(){

    setState((){
      if(_isRotated) {
        _angle = 45;
        _isRotated = false;
        _controller.forward();
      } else {
        _angle = 90;
        _isRotated = true;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Floating Action"),
        backgroundColor: Colors.deepOrange,
          elevation: defaultTargetPlatform == TargetPlatform.android? 5.0 : 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              
              UserAccountsDrawerHeader(
                accountName: Text("Dreamwalker"),
                accountEmail: Text("aristojeff@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS ?
                  Colors.deepOrange : Colors.white,
                  child: Text("P"),

                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text("K"),
                  )
                ],
              ),

              ListTile(
                title: Text("Page One"),
                trailing: Icon(Icons.arrow_upward),
//                onTap: () => {avigator.of(context).pushNamed("/a"),
              onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder:
                  (BuildContext context) => new NewPageOne("Page One")));
              },

              ),
              ListTile(
                title: Text("Page Two"),
                trailing: Icon(Icons.arrow_downward),
              ),
              Divider(),
              ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              ),

            ],
          ),
        ),
        body: new Stack(
            children: <Widget>[
              new Positioned(
                  bottom: 200.0,
                  right: 24.0,
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new ScaleTransition(
                          scale: _animation3,
                          alignment: FractionalOffset.center,
                          child: new Container(
                            margin: new EdgeInsets.only(right: 16.0),
                            child: new Text(
                              'foo1',
                              style: new TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF9E9E9E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        new ScaleTransition(
                          scale: _animation3,
                          alignment: FractionalOffset.center,
                          child: new Material(
                              color: new Color(0xFF9E9E9E),
                              type: MaterialType.circle,
                              elevation: 6.0,
                              child: new GestureDetector(
                                child: new Container(
                                    width: 40.0,
                                    height: 40.0,
                                    child: new InkWell(
                                      onTap: (){
                                        if(_angle == 45.0){
                                          print("foo1");
                                        }
                                      },
                                      child: new Center(
                                        child: new Icon(
                                          Icons.add,
                                          color: new Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              ),

              new Positioned(
                  bottom: 144.0,
                  right: 24.0,
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new ScaleTransition(
                          scale: _animation2,
                          alignment: FractionalOffset.center,
                          child: new Container(
                            margin: new EdgeInsets.only(right: 16.0),
                            child: new Text(
                              'foo2',
                              style: new TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF9E9E9E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        new ScaleTransition(
                          scale: _animation2,
                          alignment: FractionalOffset.center,
                          child: new Material(
                              color: new Color(0xFF00BFA5),
                              type: MaterialType.circle,
                              elevation: 6.0,
                              child: new GestureDetector(
                                child: new Container(
                                    width: 40.0,
                                    height: 40.0,
                                    child: new InkWell(
                                      onTap: (){
                                        if(_angle == 45.0){
                                          print("foo2");
                                        }
                                      },
                                      child: new Center(
                                        child: new Icon(
                                          Icons.add,
                                          color: new Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              new Positioned(
                  bottom: 88.0,
                  right: 24.0,
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new ScaleTransition(
                          scale: _animation,
                          alignment: FractionalOffset.center,
                          child: new Container(
                            margin: new EdgeInsets.only(right: 16.0),
                            child: new Text(
                              'foo3',
                              style: new TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF9E9E9E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        new ScaleTransition(
                          scale: _animation,
                          alignment: FractionalOffset.center,
                          child: new Material(
                              color: new Color(0xFFE57373),
                              type: MaterialType.circle,
                              elevation: 6.0,
                              child: new GestureDetector(
                                child: new Container(
                                    width: 40.0,
                                    height: 40.0,
                                    child: new InkWell(
                                      onTap: (){
                                        if(_angle == 45.0){
                                          print("foo3");
                                        }
                                      },
                                      child: new Center(
                                        child: new Icon(
                                          Icons.add,
                                          color: new Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              new Positioned(
                bottom: 16.0,
                right: 16.0,
                child: new Material(
                    color: new Color(0xFFE57373),
                    type: MaterialType.circle,
                    elevation: 6.0,
                    child: new GestureDetector(
                      child: new Container(
                          width: 56.0,
                          height: 56.00,
                          child: new InkWell(
                            onTap: _rotate,
                            child: new Center(
                                child: new RotationTransition(
                                  turns: new AlwaysStoppedAnimation(_angle / 360),
                                  child: new Icon(
                                    Icons.add,
                                    color: new Color(0xFFFFFFFF),
                                  ),
                                )
                            ),
                          )
                      ),
                    )
                ),
              ),
            ]
        )
    );
  }
}