import 'dart:math';

import 'package:flutter/material.dart';
class RandomColor{

  static Color generateColor(){
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}