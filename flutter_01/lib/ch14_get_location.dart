import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter/services.dart';


/**
 *   {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
    "lat": "-37.3159",
    "lng": "81.1496"
    }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
    }
    },

 */

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}
class Geo {
  final String let, lng;
  Geo({this.let, this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(let: json['lat'], lng: json['lng']);
  }
}
class Address {
  final String street, suite, zipcode;
  final Geo geo;
  Address({this.street, this.suite, this.zipcode, this.geo});
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo']));
  }
}
class User {
  final int id;
  final String name, username, email, phone, website;
  final Address address;
  final Company company;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
        this.address,
        this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']));
  }
}
Future<List<User>> fetchListUser() async {
  String urls = 'https://jsonplaceholder.typicode.com/users';
  final response = await http.get(urls);
  if (response.statusCode == 200) {
    List users = json.decode(response.body);
    return users.map((user) => new User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load Users');
  }
}

class MyLocationPark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        title: 'GET MY LOCATION',
        theme: new ThemeData(
          accentColor: Colors.tealAccent,
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DisplayLayout();
}

class DisplayLayout extends State<MyHomePage> {

  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String, double>> locationSubscription;
  Location locations = new Location();
  String error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 기본 주소
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();
    locationSubscription = locations.onLocationChanged().listen((Map<String,double> result){
      setState(() {
        currentLocation = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Json BASIC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Lat/Lng : ${currentLocation['latitude']} / ${currentLocation['longitude']}',
              style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),)

            ],
          ),
    ));
  }

  void initPlatformState() async{
    Map<String, double> myLocation;
    try{
      myLocation = await locations.getLocation();
      error ="";
    }on PlatformException catch(e){
      if(e.code =='PERMISSION_DENIED'){
        error = 'PERMISSION_DENIED';
      }else if(e.code == 'PERMISSION_DENIED_NEVER_ASK'){
        error = 'PERMISSION_DENIED_NEVER_ASK';
      }
      myLocation = null;
    }

    setState(() {
      currentLocation = myLocation;
    });

  }
}

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'Click Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#333639',
                  textcolor: '#ffffff');
            },
            child: Text('On Click'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: 'Single Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#000000',
                  textcolor: '#ffffff');
            },
            onDoubleTap: () {
              Fluttertoast.showToast(
                  msg: 'Double Tap Event fire',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  bgcolor: '#c51162',
                  textcolor: '#ffffff');
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text('Tap Here'),
            ),
          ),
        )
      ],
    );
  }
}
