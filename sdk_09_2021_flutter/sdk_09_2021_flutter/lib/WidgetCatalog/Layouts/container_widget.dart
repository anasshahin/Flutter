import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Widget'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text('Hi',style: TextStyle(fontSize: 24),),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
       height: 100,
        width: 100,
      ),
    );
  }
}
