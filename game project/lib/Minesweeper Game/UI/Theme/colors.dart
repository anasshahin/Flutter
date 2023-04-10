import 'package:flutter/material.dart';

import '../../prefs_state/prefs_states.dart';
    class AppColor{
      static bool lightMode=Prefs.getBoolValue("AppearanceMode")??true;
      static Color  primaryColor=lightMode?const Color(0xFF1f1b18):const Color(0xFF14AAF5);
      static Color secondaryColor=const Color(0xffdd6e41);
      static Color accentColor=const Color(0xff7a9eb8);
      static Color lightPrimaryColor=lightMode?const Color(0xFF3F3A36):const Color(0xFF1E2F97);
      static Color clickedCard=lightMode?const Color(0xFF3F3A36):const Color(0xFF00008b);

      static List<Color> letterColors=[
        Colors.white,
        Colors.blue.shade100,
        Colors.greenAccent,
        Colors.green,
        Colors.yellow,
        Colors.amber,
        Colors.orange,
        Colors.red,
      ];
     /* static void init() {
        if (Prefs.containsKey('AppearanceMode')) {
          var appearanceMode = Prefs.getStringValue('AppearanceMode');
          if (appearanceMode == 'dark') {
            appTheme = ThemeData(
                fontFamily: 'Cairo',
                backgroundColor: primaryColor,
                primaryColor: primaryColor,
                accentColor: accentColor,
                cursorColor: accentColor,
                scaffoldBackgroundColor: darkPrimary,
                appBarTheme: const AppBarTheme(
                elevation: 0.5,
                textTheme: TextTheme(
                subtitle1: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
            ),
        ),
        ),*/
    }