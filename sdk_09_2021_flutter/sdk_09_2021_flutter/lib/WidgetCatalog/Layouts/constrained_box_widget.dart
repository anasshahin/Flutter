import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox Widget'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.tightForFinite(),
        child: Card(
          color: Colors.green,
          child: Text('ConstrainedBox'),
        ),
      ),
    );
  }
}
