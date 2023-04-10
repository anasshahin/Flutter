import 'package:flutter/material.dart';

import 'Dismissible widget/dismissible_widget.dart';
import 'Expandable List/expandable_list.dart';
import 'Expandable List/marquee_wid.dart';
import 'List Wheel ScrollView/list_wheel_scrollview_wid.dart';
import 'Percent Indicator/percent_indicator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  ListWheelScrollViewWidget(),
    );
  }
}
    class ThemeAppColors extends StatefulWidget {
  const ThemeAppColors({Key? key}) : super(key: key);

  @override
  State<ThemeAppColors> createState() => _ThemeAppColorsState();
}

class _ThemeAppColorsState extends State<ThemeAppColors> {
  ThemeMode themeMode = ThemeMode.dark;
  bool valueMood = false;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp (
      debugShowCheckedModeBanner:false ,
      themeMode:themeMode ,// set up the theme
      theme: ThemeData(primaryColor: Colors.white,canvasColor:Colors.white, ),
      darkTheme: ThemeData(primaryColor: Colors.black26,canvasColor:Colors.black26),
      home: Scaffold(
        appBar: AppBar(),
        body: buildSwitch(),
      ),
    );
  }

  Center buildSwitch() {
    return Center(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          children: [
        const  Text('Light',style: TextStyle(fontWeight: FontWeight.bold),),
          Switch(value:valueMood , onChanged: (val){
            setState(() {
              valueMood = val;
              if(!valueMood) {
                themeMode = ThemeMode.dark;
              } else {
                themeMode = ThemeMode.light;
              }
            });
          }),
        const  Text('Dark',style: TextStyle(fontWeight: FontWeight.bold),),
           // SwitchListTile(value: value, onChanged: onChanged,)
          ],
        ),
      );
  }
}
