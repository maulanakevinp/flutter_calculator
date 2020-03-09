import 'package:flutter/material.dart';
import './views/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: Home(),
    );
  }
}