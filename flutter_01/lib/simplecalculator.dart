import 'package:flutter/material.dart';

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'My calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator> {

  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();

  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";


  void sum() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  void minus() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void times() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  void divide() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: AppBar(
        title: Text("IF(FLUTTER)"),
      ),
      body: Form(
        key: my_form_key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: controller_numberA,
              validator: (value) {
                if (value.isEmpty) {
                  return "숫자를 입력해주세요";
                }
              },
              decoration: InputDecoration(hintText: "숫자를 입력하세요 "),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: controller_numberB,
              validator: (value) {
                if (value.isEmpty) {
                  return "숫자를 입력해주세요";
                }
              },
              decoration: InputDecoration(hintText: "숫자를 입력하세요 "),
              keyboardType: TextInputType.number,
            ),

            Text(
              textToShow,
              style: TextStyle(
                fontSize: 20.0
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(onPressed: sum,
                      child: Text("+"),),

                  RaisedButton(onPressed: minus,
                    child: Text("-"),),

                  RaisedButton(onPressed: times,
                    child: Text("*"),),

                  RaisedButton(onPressed: divide,
                    child: Text("/"),),



                ],)


          ],
        ),)
      ,
    );
  }

}