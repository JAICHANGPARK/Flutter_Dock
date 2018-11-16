import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/model/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Quiz quiz;
  List<Results> results;

  Future<void> fecthQuestions() async {
    var res = await http.get("https://opentdb.com/api.php?amount=20");
    var decRes = jsonDecode(res.body);
    print(decRes);

    quiz = Quiz.fromJson(decRes);
    results = quiz.results;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: fecthQuestions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Press button to start");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container();
              }
//              return Container(child: Text("Data arrtived"),);
              return questionList();
          }
          return null;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
            color: Colors.white,
            elevation: 0.0,
            child: ExpansionTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    results[index].question,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(results[index].category),
                            onSelected: (b) {}),
                        SizedBox(
                          width: 10.0,
                        ),
                        FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(results[index].difficulty),
                            onSelected: (b) {})
                      ],
                    ),
                  )
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Text(results[index].type.startsWith("m") ? "M" : "B"),
              ),
              children: results[index].incorrectAnswers.map((m) {
                return AnswerWidget(results, index, m);
              }).toList(),
            ),
          ),
    );
  }
}

class AnswerWidget extends StatefulWidget {
  final List<Results> _results;
  final int index;
  final String m;

  AnswerWidget(this._results, this.index, this.m);

  @override
  State<StatefulWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget._results[widget.index].correctAnswer) {
            c = Colors.green;
          } else {
            c = Colors.red;
          }
        });
      },
      title: Text(

        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
