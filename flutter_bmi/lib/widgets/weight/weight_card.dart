import 'package:flutter/material.dart';
import 'package:flutter_bmi/utils/widget_utils.dart' show screenAwareSize;
import 'package:flutter_bmi/widgets/card_title.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(32.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              CardTitle("WEIGHT", subtitle: "(kg)",),
              Container(),

            ],
          ),
      ),
    );
  }
}
