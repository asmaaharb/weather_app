import 'package:flutter/material.dart';
class ResultText extends StatelessWidget {
  const ResultText({this.data}) ;
final data;
  @override
  Widget build(BuildContext context) {
    return Text(data, style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600),
    );
  }
}
