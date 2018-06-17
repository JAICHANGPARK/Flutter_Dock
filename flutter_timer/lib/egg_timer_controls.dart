import 'package:flutter/material.dart';
import 'package:flutter_timer/egg_timer_button.dart';

class EggTimerControls extends StatefulWidget {
  @override
  _EggTimerControlsState createState() => _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Row(
          children: [
            new EggTimerButton(
              icon: Icons.refresh,
              text: 'Restart',
            ),
            new Expanded(child: new Container()),
            new EggTimerButton(
              icon: Icons.arrow_back,
              text: 'Reset',
            )
          ],
        ),
        new EggTimerButton(
          icon: Icons.pause,
          text: 'Pause',
        ),
      ],
    );
  }
}
