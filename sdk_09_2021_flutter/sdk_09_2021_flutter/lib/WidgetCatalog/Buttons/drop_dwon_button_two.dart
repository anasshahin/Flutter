import 'package:flutter/material.dart';

class MyDropDownButtonTwo extends StatefulWidget {
  @override
  _MyDropDownButtonTwoState createState() => _MyDropDownButtonTwoState();
}

class _MyDropDownButtonTwoState extends State<MyDropDownButtonTwo> {
  String selectedValue = 'Select State';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownButton'),
      ),
      body: Center(
        child: DropdownButton(
          items: WeatherState.weatherStates.map((kkkk) {
            return DropdownMenuItem<String>(
              child: Text(kkkk.state),
              value: kkkk.state,
            );
          }).toList(),
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

class WeatherState {
  String state;

  WeatherState({required this.state});

  String get State => state;

  set State(String value) {
    state = value;
  }

  static List get weatherStates => [
        WeatherState(state: 'Select State'),
        WeatherState(state: 'Sunny'),
        WeatherState(state: 'Cloudy'),
        WeatherState(state: 'Windy'),
        WeatherState(state: 'Rainy'),
        WeatherState(state: 'Stormy')
      ];
}
