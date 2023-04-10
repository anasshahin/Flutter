import 'package:flutter/material.dart';

class Intersection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicWidth')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.shade500,
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Short'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('A bit Longer'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('The Longest text button'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.all(10),
              // color: Colors.blue.shade300,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(children: [
                            Container(
                              height: 120.0,
                              color: Colors.yellow,
                            ),
                            Container(
                              height: 100.0,
                              color: Colors.cyan,
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.amber,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
