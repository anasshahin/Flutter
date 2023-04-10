import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPush/screen_three.dart';

class NavigationScreenTwo extends StatefulWidget {
  const NavigationScreenTwo({Key? key, required this.argument})
      : super(key: key);
  final String argument;

  @override
  _NavigationScreenTwoState createState() => _NavigationScreenTwoState();
}

class _NavigationScreenTwoState extends State<NavigationScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Screen Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Navigation Screen Two with argument : ${widget.argument}'),
            ElevatedButton(
              child: Text('Click'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => NavigationScreenThree()));
              },
            )
          ],
        ),
      ),
    );
  }
}
