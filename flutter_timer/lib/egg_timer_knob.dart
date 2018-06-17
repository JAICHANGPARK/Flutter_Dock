import 'package:flutter/material.dart';


final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class EggTimerDialKnob extends StatefulWidget {
  @override
  _EggTimerDialKnobState createState() => _EggTimerDialKnobState();
}

class _EggTimerDialKnobState extends State<EggTimerDialKnob> {
  @override
  Widget build(BuildContext context) {
    return  new Stack(
      children: [
        //원안에 무언가를 더 넣기위해 stack을 사용
        new Container(
          width: double.infinity,
          height: double.infinity,
          child: new CustomPaint(
            painter: new ArrowPainter(),
          ),
        ),

        new Container(
          padding: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
            ),
            boxShadow: [
              new BoxShadow(
                color: const Color(0x44000000),
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 1.0),
              )
            ],
          ),
          child: new Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: new Border.all(
                  color: const Color(0xFFDFDFDF),
                  width: 1.5,
                )),
            child: new Center(
              child: new Image.network(
                'https://avatars3.githubusercontent.com/u/14101776?s=400&v=4',
                width: 50.0,
                height: 50.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Paint dialArrowPaint;

  ArrowPainter() : dialArrowPaint = new Paint() {
    dialArrowPaint.color = Colors.black;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.translate(size.width / 2, 0.0);

    Path path = new Path();
    path.moveTo(0.0, -10.0);
    path.lineTo(10.0, 5.0);
    path.lineTo(-10.0, 5.0);
    path.close();

    canvas.drawPath(path, dialArrowPaint);
    canvas.drawShadow(path, Colors.black, 3.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
