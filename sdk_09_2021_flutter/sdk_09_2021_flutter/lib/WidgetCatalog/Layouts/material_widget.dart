import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('shape: BeveledRectangleBorder')),
      body: Center(
        child: Material(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.black, width: 4),
          ),
          color: Colors.yellow,
          child: Container(
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
