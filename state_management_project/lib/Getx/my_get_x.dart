import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CounterController extends GetxController {
  int counter = 0;
RxInt count =0.obs;
  void increment(){
    counter++;
    update();
  }
  void incrementRx(){
    count.value++;
  }
}