import 'package:flutter/material.dart';

class MyFlatButtonWidget extends StatefulWidget {
  @override
  _MyFlatButtonWidgetState createState() => _MyFlatButtonWidgetState();
}

class _MyFlatButtonWidgetState extends State<MyFlatButtonWidget> {
  var someData = [10, 20, 30, 40, 50, 60, 70, 80];
  var dateCount = 0;
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              child: Text('Flat Button'),
              onPressed: () {
                setState(() {
                  print('click $counter');
                  if (dateCount > 7) {
                    dateCount = 0;
                  }
                  if (counter % 10 == 0) {
                    dateCount++;
                  }

                  counter++;
                });
              },
            ),
            Text(
              someData[dateCount].toString(),
              style: TextStyle(
                fontSize: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
