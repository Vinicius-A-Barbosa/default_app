import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimationView extends StatefulWidget {
  const ExplicitAnimationView({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationView> createState() => _ExplicitAnimationViewState();
}

class _ExplicitAnimationViewState extends State<ExplicitAnimationView> with TickerProviderStateMixin {
  late AnimationController _hoursController;
  late AnimationController _minutesController;
  late AnimationController _secondsController;

  @override
  void initState() {
    super.initState();
    _hoursController = AnimationController(
      duration: Duration(seconds: 360),
      vsync: this,
    )..repeat();
    _minutesController = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    )..repeat();
    _secondsController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    //var currentTime = DateTime.fromMillisecondsSinceEpoch(1656903600000);
    var currentTime = DateTime.now();
    var currentHour = (currentTime.hour >= 12 ? currentTime.hour - 12 : currentTime.hour).toDouble();
    var currentMinute = currentTime.minute.toDouble();
    var currentSecond = currentTime.second.toDouble();

    return Stack(
      children: [
        Center(
          child: Image.asset('assets/images/clock.png')
        ),
        RotationTransition(
          turns: _hoursController,
          child: Transform.rotate(
            angle: (pi / 6 * currentHour) - pi / 2,
            child: Transform.translate(
              offset: Offset(50, 0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 12,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
        RotationTransition(
          turns: _minutesController,
          child: Transform.rotate(
            angle: (pi / 30 * currentMinute) - pi / 2,
            child: Transform.translate(
              offset: Offset(70, 0),
              child: Center(
                child: Container(
                  width: 180,
                  height: 9,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        RotationTransition(
          turns: _secondsController,
          child: Transform.rotate(
            angle: (pi / 30 * currentSecond) - pi / 2,
            child: Transform.translate(
              offset: Offset(60, 0),
              child: Center(
                child: Container(
                  width: 180,
                  height: 6,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 12,
            height: 12,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            child: IconButton(
              onPressed: () {
                if (_hoursController.isAnimating) {
                  _hoursController.stop();
                  _minutesController.stop();
                  _secondsController.stop();
                } else {
                  _hoursController.repeat();
                  _minutesController.repeat();
                  _secondsController.repeat();
                }
                setState(() {});
              },
              icon: Icon(
                _hoursController.isAnimating ? Icons.pause : Icons.play_arrow,
                color: Colors.purpleAccent,
                size: 20,
              )
            ),
          ),
        ),
      ],
    );
  }
}
