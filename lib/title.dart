import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  String? title = 'test';
  AppTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title as String,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
