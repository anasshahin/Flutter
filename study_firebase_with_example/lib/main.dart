import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Product_App/products.dart';
import 'screens/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp(
    ChangeNotifierProvider<Products>(
      create: (_) => Products(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        cardColor: Colors.blueGrey[400],
        canvasColor: Colors.blueGrey.withOpacity(0.2),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
    );
  }
}
