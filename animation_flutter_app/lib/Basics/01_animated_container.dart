import 'package:flutter/material.dart';
import 'dart:math';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimatedContainerDemo extends StatefulWidget {
  static String routeName ='Basics/01_animated_container';
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color color;
  double borderRadius;
  double margin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.indigoAccent;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  void change(){
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: 256,
                height: 256,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: Duration(milliseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => change(),
                child: Text('Change')
            )
          ],
        ),
      ),
    );
  }
}
