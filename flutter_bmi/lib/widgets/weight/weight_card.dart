import 'package:flutter/material.dart';
import 'package:flutter_bmi/utils/widget_utils.dart' show screenAwareSize;
import 'package:flutter_bmi/widgets/card_title.dart';
import 'package:flutter_bmi/widgets/weight/weight_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(4.0, context),
        bottom: screenAwareSize(4.0, context),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenAwareSize(32.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle(
              "WEIGHT",
              subtitle: "(kg)",
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _drawSlider(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(builder: (context, constraints) => WeightSlider(
        maxValue: 130,
        minValue: 30,
        width: constraints.maxHeight,
      )),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
              color: Color.fromRGBO(244, 244, 244, 1.0),
              borderRadius:
                  BorderRadius.circular(screenAwareSize(50.0, context))),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        )
      ],
    );
  }
}
