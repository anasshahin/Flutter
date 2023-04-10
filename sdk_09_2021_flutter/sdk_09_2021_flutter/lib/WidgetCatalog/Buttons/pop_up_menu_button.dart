import 'package:flutter/material.dart';

class MyPopUpMenuButton extends StatefulWidget {
  @override
  _MyPopUpMenuButtonState createState() => _MyPopUpMenuButtonState();
}

class _MyPopUpMenuButtonState extends State<MyPopUpMenuButton> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        // foregroundColor: Colors.red,
        title: Text('Popup Menu Button'),
        actions: [
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  child: Container(
                      color: choice.color,
                      child: Text(choice.name)),
                  value: choice,
                );
              }).toList();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ChoiceCard(_selectedChoice),
      ),
    );
  }
}

class Choice {
  final String name;
  final IconData icon;
  final Color color;

  const Choice({required this.name, required this.icon, required this.color});
}

const List<Choice> choices = const [
  const Choice(name: 'Wi-Fi', icon: Icons.wifi, color: Colors.grey),
  const Choice(name: 'Bluetooth', icon: Icons.bluetooth, color: Colors.blue),
  const Choice(name: 'Battery', icon: Icons.battery_alert, color: Colors.red),
  const Choice(name: 'Storage', icon: Icons.storage, color: Colors.green),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  ChoiceCard(this.choice);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: choice.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(choice.icon, size: 115.0),
            Text(choice.name, style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
