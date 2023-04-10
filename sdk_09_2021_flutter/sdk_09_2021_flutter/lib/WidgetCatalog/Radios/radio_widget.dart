import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _groupValue1;
  int? _groupValue2;
  int? _groupValue3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kids Quiz App'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
            padding: EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Select correct answers from below:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Divider(height: 5.0, color: Colors.black),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                'Lion is :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _groupValue1,
                    onChanged: (value) {
                      setState(() {
                        _groupValue1 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Carnivore',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _groupValue1,
                    onChanged: (value) {
                      setState(() {
                        _groupValue1 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Herbivore',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _groupValue1,
                    onChanged: (value) {
                      setState(() {
                        _groupValue1 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Omnivore',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              Divider(height: 5.0, color: Colors.black),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                'Monkey is :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _groupValue2,
                    onChanged: (value) {
                      setState(() {
                        _groupValue2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Carnivore',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _groupValue2,
                    onChanged: (value) {
                      setState(() {
                        _groupValue2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Herbivore',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _groupValue2,
                    onChanged: (value) {
                      setState(() {
                        _groupValue2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Omnivore',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ])));
  }
}
