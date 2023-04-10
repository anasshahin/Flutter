import 'package:flutter/material.dart';

class MyTextIconButtonWidget extends StatefulWidget {
  @override
  _MyTextIconButtonWidgetState createState() => _MyTextIconButtonWidgetState();
}

class _MyTextIconButtonWidgetState extends State<MyTextIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
      ),
      body: Center(
        child: TextButton.icon(
            icon: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            ),
            label: Text('Text Icon Button'),
            onPressed: null),
      ),
    );
  }
}
