import 'dart:ui';

import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Widget'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.deepPurple,
                      child: Center(
                          child: Text(
                        'Row 1 - Exp 1 - flex = 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16,),
                      )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: Center(
                          child: Text(
                            'Row 1 - Exp 2 - flex = 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.teal,
                      child: Center(
                          child: Text(
                            'Row 1 - Exp 3 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                            'Column 1 - Exp 1 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.brown,
                      child: Center(
                          child: Text(
                            'Column 1 - Exp 2 - flex = 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: Center(
                          child: Text(
                            'Column 1 - Exp 3 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),

              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.orange,
                      child: Center(
                          child: Text(
                            'Row 2 - Exp 1 - flex = 3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.pinkAccent,
                      child: Center(
                          child: Text(
                            'Row 2 - Exp 2 - flex = 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                          child: Text(
                            'Row 2 - Exp 3 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                            'Column 2 - Exp 1 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.brown,
                      child: Center(
                          child: Text(
                            'Column 2 - Exp 2 - flex = 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: Center(
                          child: Text(
                            'Column 2 - Exp 3 - flex = 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
