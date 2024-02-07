import 'package:flutter/material.dart';
class  ModelTypeProvider extends ChangeNotifier{
  int counter = 0;
int num =9;
  void increment(){
    counter++;
    notifyListeners();
  }
}