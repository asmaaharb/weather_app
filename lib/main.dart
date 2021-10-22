import 'package:flutter/material.dart';
import 'package:weather/screens/splash/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEATHER',
      theme: ThemeData(),
      home: SplashView(),
    );
  }
}

 