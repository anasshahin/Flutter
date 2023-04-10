import 'package:flutter/material.dart';
import 'package:game_project/Minesweeper%20Game/prefs_state/prefs_states.dart';
import 'package:game_project/Minesweeper%20Game/router/constant_router.dart';
import 'package:game_project/Minesweeper%20Game/router/router.dart';

import 'UI/Screen/first_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoute2.generateRoute,
      initialRoute: firstUi,
      home: FirstScreen() ,
    );
  }
}
