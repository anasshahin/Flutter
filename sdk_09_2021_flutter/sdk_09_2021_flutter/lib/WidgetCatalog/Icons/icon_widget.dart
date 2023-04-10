import 'package:flutter/material.dart';

class MyIconPage extends StatefulWidget {
  @override
  _MyIconPageState createState() => _MyIconPageState();
}

class _MyIconPageState extends State<MyIconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Icon Tutorial'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(Icons.camera_enhance),
        Icon(Icons.camera_front),
        Icon(Icons.camera_rear),
      ]),
    );
  }
}
