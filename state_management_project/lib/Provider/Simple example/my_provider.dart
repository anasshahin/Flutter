import 'package:flutter/material.dart';
class MyProvider extends ChangeNotifier{
  int counter = 0;

  void increment(){
    counter++;
    notifyListeners();
  }
}