import 'package:flutter/material.dart';
class ClockTimer extends StatelessWidget {
  const ClockTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(Icons.timelapse,color: Colors.blue,size: 50,)),
    );
  }
}
