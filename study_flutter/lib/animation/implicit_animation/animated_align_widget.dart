import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  double xAxis = 0;
  double yAxis = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.yellow,
          child: AnimatedAlign(
            alignment: Alignment(xAxis, yAxis),
            duration: const Duration(milliseconds: 1500),
            child: const FlutterLogo(
              size: 28,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.play_arrow),
          onPressed: () {
        setState(() {
          Random random = Random();
          xAxis = random.nextInt(100) * 0.01;
          yAxis = random.nextInt(100) * 0.01;
        });
      }),
    );
  }
}
