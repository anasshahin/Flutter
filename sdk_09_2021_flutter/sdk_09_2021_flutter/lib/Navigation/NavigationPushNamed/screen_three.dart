import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPush/screen_one.dart';
import 'package:sdk_09_2021_flutter/Routes/constant_routes.dart';

class NavigationScreenThree extends StatefulWidget {
  const NavigationScreenThree({Key? key}) : super(key: key);

  @override
  _NavigationScreenThreeState createState() => _NavigationScreenThreeState();
}

class _NavigationScreenThreeState extends State<NavigationScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Screen Three'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Navigation Screen Three'),
            ElevatedButton(
              child: Text('Click'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  s1Route,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
