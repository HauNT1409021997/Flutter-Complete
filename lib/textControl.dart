import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  Function? buttonHandler;
  TextControl({this.buttonHandler});

  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {(buttonHandler as Function)()},
        child: Text('change Text'));
  }
}
