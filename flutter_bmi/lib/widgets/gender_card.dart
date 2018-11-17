import 'package:flutter/material.dart';
import 'package:flutter_bmi/model/gender.dart';
import 'card_title.dart';

import 'package:flutter_bmi/utils/widget_utils.dart' show screenAwareSize;

class GenderCard extends StatefulWidget {
  final Gender initGender;

  GenderCard({Key key, this.initGender}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GenderCardState();
}

double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CardTitle("Gender")
              ],
            ),
        ),
      ),
    );
  }
}
