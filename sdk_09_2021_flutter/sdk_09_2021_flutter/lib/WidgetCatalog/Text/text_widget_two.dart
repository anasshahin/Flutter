import 'package:flutter/material.dart';

class TextWidgetExampleTen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget Example Ten'),
      ),
      body: Container(
        child: Row(
          children: [
            Padding(
              child: Text(
                "One",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blue,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(10),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Two",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blue,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Text(
                "Three - 51516511111111111111111",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blue,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWidgetExampleEleven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget Example Ten'),
      ),
      body: Text(
        "Three - 515165111111111111asdasasdasdddddddddddddddddddssssssssssssssssssssssssssssssssssss",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.blue,
            fontFamily: "Caveat",
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
