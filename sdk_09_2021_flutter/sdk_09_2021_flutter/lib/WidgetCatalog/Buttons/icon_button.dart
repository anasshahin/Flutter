import 'package:flutter/material.dart';

double _speakervolume = 0.0;

class MyIconButton extends StatefulWidget {
  MyIconButton({Key? key}) : super(key: key);

  @override
  _MyIconButtonState createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.volume_up),
              iconSize: 50,
              color: Colors.brown,
              tooltip: 'Increase volume by 5',
              onPressed: () {
                setState(() {
                  _speakervolume += 5;
                });
              },
            ),
            Text('Speaker Volume: $_speakervolume')
          ],
        ),
      ),
    );
  }
}
