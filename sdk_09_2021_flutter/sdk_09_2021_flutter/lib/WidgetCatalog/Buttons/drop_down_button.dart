import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {

  var selectedValue = 'Select Number';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownButton'),
      ),
      body: Center(
        child: DropdownButton(
          items: [
            DropdownMenuItem(
              child: Text('Select Number'),
              value: 'Select Number',
            ),
            DropdownMenuItem(
              child: Text('1'),
              value: '1',
            ),
            DropdownMenuItem(
              child: Text('2'),
              value: '2',
            ),
            DropdownMenuItem(
              child: Text('3'),
              value: '3',
            ),
          ],
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ),
    );
  }
}
