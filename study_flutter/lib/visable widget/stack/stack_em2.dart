import 'package:flutter/material.dart';
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            width: 250,
            height: 250,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: const Text(
                'Slide 1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 60,
            width: 250,
            height: 250,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.green,
              child: const Text(
                'Slide 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 90,
            width: 250,
            height: 250,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: const Text(
                'Slide 3',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
