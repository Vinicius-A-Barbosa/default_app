import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationView extends StatefulWidget {
  const ImplicitAnimationView({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationView> createState() => _ImplicitAnimationViewState();
}

class _ImplicitAnimationViewState extends State<ImplicitAnimationView> {
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
        AnimatedPositioned(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            top: (screenHeight - _height),
            right: (screenWidth - _width),
            height: _height,
            width: _width,
            child: GestureDetector(
              onTap: _moveBall,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: circleColor),
              ),
            ))
      ],
    );
  }
}
