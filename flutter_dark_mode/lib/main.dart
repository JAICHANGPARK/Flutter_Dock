import 'package:flutter/material.dart';
import 'package:flutter_dark_mode/settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool darkModeEnable = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: darkModeEnable ? ThemeData.dark() : ThemeData.light(),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //5
        '/screen1': (BuildContext context) => new SettingPage(), //6
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: new AppBar(
        title: new Text("hello"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/screen1'); //2
              },
              child: ListTile(
                  title: Text("Dark Mode"),
                  trailing: Icon(Icons.arrow_forward)),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
          ],
        ),
      ),

//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//class MyHomePage extends StatelessWidget {
//
//  var darkModeEnable;
//  MyHomePage(this.darkModeEnable);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("hello"),
//      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text("Dark Mode"),
//              trailing: Switch(
//                  value: darkModeEnable,
//                  onChanged: (changedTheme){
//
//                    darkModeEnable = changedTheme;
//                  }),
//            ),
//          ],
//        ),
//      ),
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
////            new Text(
////              '$_counter',
////              style: Theme.of(context).textTheme.display1,
////            ),
//          ],
//        ),
//      ),
//
////      floatingActionButton: new FloatingActionButton(
////        onPressed: _incrementCounter,
////        tooltip: 'Increment',
////        child: new Icon(Icons.add),
////      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
