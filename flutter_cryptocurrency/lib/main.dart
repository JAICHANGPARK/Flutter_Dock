import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  runApp(new MyApp(currencies));
}

Future<List> getCurrencies() async {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);
  return json.decode(response.body);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null
      ),
      home: new MyHomePage(_currencies),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List currencies;

  MyHomePage(this.currencies);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

//  @override
//  void initState() async {
//    // TODO: implement initState
//    super.initState();
////    currencies = await getCurrencies();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryptocurrency"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _cryptoWidget(),
//      body: new Center(
//
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
        onPressed: () {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  itemCount: widget.currencies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map currency = widget.currencies[index];
                    final MaterialColor color = _colors[index % _colors.length];
                    return _getListItemUi(currency, color);
                  })),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: new Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String currency, String currency2) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$currency\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $currency2%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(currency2) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
