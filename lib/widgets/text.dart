import 'package:flutter/material.dart';
class HomeHint extends StatelessWidget {
  const HomeHint({this.data}) ;
final data;
  @override
  Widget build(BuildContext context) {
    return Text(data, style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
    );
  }
}
