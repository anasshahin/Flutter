import 'dart:developer';

import 'package:flutter/material.dart';

class ProviderModel with ChangeNotifier{
ThemeMode themeMode = ThemeMode.light;
 bool swVal=false;
void switchChange(bool value){
  swVal=value;
  if (value == false){
    themeMode= ThemeMode.light;
    log('$themeMode');
  }else{
    themeMode= ThemeMode.dark;
    log('$themeMode');

  }
  notifyListeners();
}
}
