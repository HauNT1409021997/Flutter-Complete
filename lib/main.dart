import 'package:flutter/material.dart';
import './title.dart';
import './textControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _titleObject = {
    'default': 'Default Title',
    'usual': 'Different Title',
  };
  var _title = 'Default title';
  void changeTitleHandler() {
    setState(() {
      if (_title == _titleObject['default']) {
        _title = _titleObject['usual']!;
      } else {
        _title = _titleObject['default']!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
              child: Column(
            children: [
              AppTitle(
                title: _title,
              ),
              TextControl(
                buttonHandler: changeTitleHandler,
              )
            ],
          )),
        ),
      ),
    );
  }
}
