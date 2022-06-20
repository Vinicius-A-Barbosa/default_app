import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationView extends StatefulWidget {
  const TweenAnimationView({Key? key}) : super(key: key);

  @override
  State<TweenAnimationView> createState() => _TweenAnimationViewState();
}

class _TweenAnimationViewState extends State<TweenAnimationView> {
  var _height = 50.0;
  var _width = 100.0;

  void _moveBall() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = _height +
        Random().nextDouble() * (MediaQuery.of(context).size.height - _height);
    var screenWidth = _width +
        Random().nextDouble() * (MediaQuery.of(context).size.width - _width);
    var circleColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return Stack(
      children: [
        Center(
          child: Container(
            width: 400,
            height: 400,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
        ),
        TweenAnimationBuilder(
          duration: Duration(seconds: 216000),
          tween: Tween<double>(begin: 0, end: 59),
          builder: (_, double time, __) {
            return Transform.rotate(
              angle: (pi / 2 * time) - pi / 2,
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
          duration: Duration(seconds: 3600),
          tween: Tween<double>(begin: 0, end: 59),
          builder: (_, double time, __) {
            return Transform.rotate(
              angle: (pi / 2 * time) - pi / 2,
              child: Transform.translate(
                offset: Offset(70, 0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 9,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          },
        ),
        TweenAnimationBuilder(
          duration: Duration(seconds: 60),
          tween: Tween<double>(begin: 0, end: 59),
          builder: (_, double time, __) {
            return Transform.rotate(
              angle: (pi / 2 * time) - pi / 2,
              child: Transform.translate(
                offset: Offset(60, 0),
                child: Center(
                  child: Container(
                    width: 200,
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
