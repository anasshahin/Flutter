import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPush/screen_two.dart';
import 'package:sdk_09_2021_flutter/Routes/constant_routes.dart';

class NavigationScreenOne extends StatefulWidget {
  const NavigationScreenOne({Key? key}) : super(key: key);

  @override
  _NavigationScreenOneState createState() => _NavigationScreenOneState();
}

class _NavigationScreenOneState extends State<NavigationScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Screen One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Navigation Screen One'),
            ElevatedButton(
              child: Text('Click'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  s2Route,
                  arguments: 'Hello Word'
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
