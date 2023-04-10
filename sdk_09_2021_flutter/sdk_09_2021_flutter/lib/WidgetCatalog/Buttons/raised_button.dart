import 'package:flutter/material.dart';

class MyRaisedButtonWidget extends StatefulWidget {
  @override
  _MyRaisedButtonWidgetState createState() => _MyRaisedButtonWidgetState();
}

class _MyRaisedButtonWidgetState extends State<MyRaisedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RaisedButton'),
      ),
      body: Center(
        child: RaisedButton(
            child: Image.network(
                'https://img.icons8.com/fluency/50/000000/top-view-bird.png'),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey, width: 2),
            ),
            elevation: 20,
            color: Colors.white,
            onPressed: () {
              print('Click');
            }),
      ),
    );
  }
}
