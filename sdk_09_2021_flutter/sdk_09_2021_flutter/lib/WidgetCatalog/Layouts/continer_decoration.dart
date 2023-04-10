import 'dart:math';

import 'package:flutter/material.dart';

class ContainerDecorations extends StatefulWidget {
  @override
  _ContainerDecorationsState createState() => _ContainerDecorationsState();
}

class _ContainerDecorationsState extends State<ContainerDecorations> {
  var rotate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Decorations'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 8,left: 8,right: 8),
                child: Container(
                  height: 150,
                  width: 150,
                  transform: Matrix4.rotationX(rotate),
                  decoration: BoxDecoration(color: Colors.yellowAccent),
                  child: Text(
                    'Hi',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  transform: Matrix4.rotationY(rotate),
                  decoration: BoxDecoration(color: Colors.yellowAccent),
                  child: Text(
                    'Hi',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  transform: Matrix4.rotationZ(rotate),
                  decoration: BoxDecoration(color: Colors.yellowAccent),
                  child: Text(
                    'Hi',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    for(var i = 1; i <= 360 ;i++ ){
                      Future.delayed(Duration(seconds: 1)).then((value) {
                        rotate = i * (pi / 180);
                        print(rotate);
                      });
                    }
                  });
                },
                child: Text('Start Rotate'),
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(
                    Colors.red
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
