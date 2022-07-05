import 'package:default_app/user_interface/pages/animated_builder_page/animated_builder_view.dart';
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
      home: AnimatedBuilderView(),
    );
  }
}
