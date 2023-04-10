import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        children: [
          ElevatedButton(onPressed: ()async{
            SharedPreferences _prefs = await SharedPreferences.getInstance();
            _prefs.remove('password');
            _prefs.remove('email');
          }, child: const Text('remove')),
          const Text('main app screen'),
        ],
      )),
    );
  }
}
