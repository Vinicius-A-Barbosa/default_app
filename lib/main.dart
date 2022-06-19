import 'package:default_app/user_interface/pages/implicit_animation_page/implicit_animation_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Default App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImplicitAnimationView(),
    );
  }
}
