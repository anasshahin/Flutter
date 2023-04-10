import 'package:flutter/material.dart';
import 'package:untitled/%20Minesweeper%20Game/prefs_state/prefs_states.dart';
import 'package:untitled/%20Minesweeper%20Game/router/constant_router.dart';
import 'package:untitled/%20Minesweeper%20Game/router/router.dart';

import 'UI/Screen/easy_level_screen.dart';
import 'UI/Screen/first_screen.dart';
import 'UI/Screen/hard_level_screen.dart';
import 'UI/Screen/main_screen.dart';
import 'UI/Screen/minesweeper_level_screen.dart';
import 'UI/Screen/vary_hard_level_screen.dart';
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
