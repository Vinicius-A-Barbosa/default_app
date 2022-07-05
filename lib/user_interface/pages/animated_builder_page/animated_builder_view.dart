import 'package:flutter/material.dart';

class AnimatedBuilderView extends StatefulWidget {
  const AnimatedBuilderView({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderView> createState() => _AnimatedBuilderViewState();
}

class _AnimatedBuilderViewState extends State<AnimatedBuilderView> with SingleTickerProviderStateMixin {
  late AnimationController _secondsController;

  // ignore: non_constant_identifier_names
  late Animation<double> animation_down;
  // ignore: non_constant_identifier_names
  late Animation<double> animation_up;
  double position = 0;

  @override
  void initState() {
    super.initState();



    _secondsController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    animation_down = Tween<double>(begin: 0, end: 20)
        .animate(CurvedAnimation(
            parent: _secondsController,
            curve: Interval(0, 0.5, curve: Curves.linear)));

    animation_up = Tween<double>(begin: 20, end: 0)
        .animate(CurvedAnimation(
            parent: _secondsController,
            curve: Interval(0.5, 1, curve: Curves.linear)));

    _secondsController.addListener(() {
      if (mounted) {
        setState(() {
          if (_secondsController.value >= 0 && _secondsController.value <= 0.5) {
            position = animation_down.value;
          } else if (_secondsController.value > 0.5 && _secondsController.value <= 1) {
            position = animation_up.value;
          }
        });
      }
    });
    _secondsController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 20,
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height - 80,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                left: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                right: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
              )
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.height - 100,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                left: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                right: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF0000FF)),
              )
            ),
          ),
        ),
        Transform.translate(
          //offset: Offset(32,52),
          //offset: Offset(290,52),
          //offset: Offset(32,609),
          offset: Offset(MediaQuery.of(context).size.width/2 - 20, MediaQuery.of(context).size.height/2 - 20),
          child: AnimatedBuilder(
            animation: _secondsController,
            builder: (_, __) {
              return ClipPath(
                clipper: CircleClipper(position),
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.yellow,
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  CircleClipper(this.value);
  var value;

  @override
  getClip(Size size) {
    var deslocation = value;
    var path = Path();
    path.moveTo(size.width * 0.4, size.height/2);
    path.lineTo(size.width, deslocation);
    
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - deslocation);
    path.lineTo(size.width * 0.4, size.height/2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
