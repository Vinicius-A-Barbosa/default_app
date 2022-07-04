import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationView extends StatefulWidget {
  const TweenAnimationView({Key? key}) : super(key: key);

  @override
  State<TweenAnimationView> createState() => _TweenAnimationViewState();
}

class _TweenAnimationViewState extends State<TweenAnimationView> {

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now();
    var currentHour = (currentTime.hour >= 12 ? currentTime.hour - 12 : currentTime.hour).toDouble();
    var currentMinute = currentTime.minute.toDouble();
    var currentSecond = currentTime.second.toDouble();

    return Stack(
      children: [
        Center(
          child: Image.asset('assets/images/clock.png')
        ),
        TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: currentHour),
          builder: (_, double hour, __) {
            return Transform.rotate(
              angle: (pi / 6 * hour) - pi / 2,
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
            );
          },
        ),
        TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: currentMinute),
          builder: (_, double minute, __) {
            return Transform.rotate(
              angle: (pi / 30 * minute) - pi / 2,
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
            );
          },
        ),
        TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: currentSecond),
          builder: (_, double second, __) {
            return Transform.rotate(
              angle: (pi / 30 * second) - pi / 2,
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
            );
          },
        ),
        Center(
          child: Container(
            width: 12,
            height: 12,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
