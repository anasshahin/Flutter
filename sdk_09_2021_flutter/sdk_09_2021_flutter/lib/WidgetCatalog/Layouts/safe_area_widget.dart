import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: SafeArea(
        left: false,
        child: SizedBox.expand(
          child: Card(color: Colors.teal),
        ),
      ),
    );
  }
}
