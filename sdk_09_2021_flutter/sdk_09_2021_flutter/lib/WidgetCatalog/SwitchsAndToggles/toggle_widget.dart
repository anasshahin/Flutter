import 'dart:developer';

import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({Key? key}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  var areSelected = List.generate(3, (_) => false);
  late Color color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              fillColor: Colors.red,
              color: Colors.blue,
              selectedColor: Colors.green,
              borderColor: Colors.black,
              selectedBorderColor: Colors.black,
              children: [
                Icon(
                  Icons.add_comment,
                  // color: Colors.black,
                ),
                Icon(
                  Icons.airline_seat_individual_suite,
                  // color: Colors.black,
                ),
                Icon(
                  Icons.add_location,
                  // color: Colors.black,
                ),
              ],
              isSelected: areSelected,
              onPressed: (index) {
                setState(() {
                  areSelected[index] = !areSelected[index];
                  log(areSelected.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
