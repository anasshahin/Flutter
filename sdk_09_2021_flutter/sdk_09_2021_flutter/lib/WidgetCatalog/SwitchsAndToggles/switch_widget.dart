import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  var isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.red,
                // activeThumbImage: NetworkImage('https://img.icons8.com/fluency/48/000000/rounded-rectangle.png'),
                activeThumbImage: NetworkImage(
                    'https://img.icons8.com/fluency/48/000000/rounded-rectangle.png'),
                inactiveThumbImage: NetworkImage(
                    'https://img.icons8.com/ios-glyphs/30/000000/rounded-square.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35,
                width: 125,
                child: LiteRollingSwitch(
                  //initial value
                  value: true,
                  textOn: 'Disable',
                  textOff: 'Enable',
                  colorOn: Colors.greenAccent[700],
                  colorOff: Colors.redAccent[700],
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 14.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
