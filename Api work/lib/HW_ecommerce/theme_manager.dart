import 'package:flutter/material.dart';
import 'package:untitled/HW_ecommerce/prefs_state.dart';
class ThemeManager {
  static void init() {
    if (Prefs.containsKey('AppearanceMode')) {
      var appearanceMode = Prefs.getStringValue('AppearanceMode');
      if (appearanceMode == 'dark') {
        appTheme = ThemeData(
          fontFamily: 'Cairo',
          backgroundColor: darkPrimary,
          primaryColor: darkPrimary,
          accentColor: darkAccent,
        // cursorColor: darkAccent,
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
          ),
          textTheme: TextTheme(
            headline1: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w800),
            subtitle1: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
            bodyText1: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
            bodyText2: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
            button: TextStyle(
                color: darkPrimary, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: darkAccent,
            height: 50.0,
            textTheme: ButtonTextTheme.primary,
          ),
        );
        primary = darkPrimary;
        accent = darkAccent;
        background = darkPrimary;
        iconColor = lightPrimary;
        textColor = Colors.white;
        textColorNegative = Colors.black;
        textRecognizerColor = const Color(0xff3b60ce);
      } else if (appearanceMode == 'light') {
        appTheme = ThemeData(
          fontFamily: 'Cairo',
          backgroundColor: lightPrimary,
          primaryColor: lightPrimary,
          accentColor: lightAccent,
         // cursorColor: lightAccent,
          scaffoldBackgroundColor: lightPrimary,
          appBarTheme: AppBarTheme(
            elevation: 0.5,
            textTheme: TextTheme(
              subtitle1: TextStyle(
                color: Colors.grey[600],
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.grey[600],
                fontSize: 22.0,
                fontWeight: FontWeight.w800),
            subtitle1: TextStyle(
                color: Colors.grey[700],
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
            bodyText1: TextStyle(
                color: Colors.grey[500],
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
            button: TextStyle(
                color: lightPrimary, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: lightAccent,
            height: 50.0,
            textTheme: ButtonTextTheme.primary,
          ),
        );
        primary = lightPrimary;
        accent = lightAccent;
        background = lightPrimary;
        iconColor = darkPrimary;
        textColor = Colors.black;
        textColorNegative = Colors.white;
        textRecognizerColor = Color(0xff092e90);
      }
    }else{
      appTheme = ThemeData(
        fontFamily: 'Cairo',
        backgroundColor: lightPrimary,
        primaryColor: lightPrimary,
        accentColor: lightAccent,
       // cursorColor: lightAccent,
        scaffoldBackgroundColor: lightPrimary,
        appBarTheme: AppBarTheme(
          elevation: 0.5,
          textTheme: TextTheme(
            subtitle1: TextStyle(
              color: Colors.grey[600],
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.grey[600],
              fontSize: 22.0,
              fontWeight: FontWeight.w800),
          subtitle1: TextStyle(
              color: Colors.grey[700],
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              color: Colors.grey[500],
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
          bodyText2: TextStyle(
              color: Colors.grey[500],
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
          button: TextStyle(
              color: lightPrimary, fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: lightAccent,
          height: 50.0,
          textTheme: ButtonTextTheme.primary,
        ),
      );
      primary = lightPrimary;
      accent = lightAccent;
      background = lightPrimary;
      iconColor = darkPrimary;
      textColor = Colors.black;
      textColorNegative = Colors.white;
      textRecognizerColor = Color(0xff092e90);
    }
  }

  static String appName = "SDKCommerce";
  //Colors for theme
  static Color lightPrimary = Colors.grey.shade50;
  static Color darkPrimary = Colors.grey.shade800;
  static Color lightAccent = Color(0xff00c569);
  static Color darkAccent = Color(0xff00c569);

  static Color background = lightPrimary;
  static Color accent = lightAccent;
  static Color primary = lightPrimary;
  static ThemeData appTheme = lightTheme;

  static Color badgeColor = Colors.red;
  static Color iconColor = darkPrimary;
  static Color textColor = Colors.black;
  static Color textColorNegative = Colors.black;
  static Color textRecognizerColor = Color(0xff3b60ce);


  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    backgroundColor: lightPrimary,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
   // cursorColor: lightAccent,
    scaffoldBackgroundColor: lightPrimary,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.grey[600],
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.grey[600], fontSize: 22.0, fontWeight: FontWeight.w800),
      subtitle1: TextStyle(
          color: Colors.grey[700], fontSize: 18.0, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          color: Colors.grey[500], fontSize: 18.0, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
          color: Colors.grey[500], fontSize: 14.0, fontWeight: FontWeight.w400),
      button: TextStyle(
          color: lightPrimary, fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightAccent,
      height: 50.0,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}