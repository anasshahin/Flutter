import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import 'my_get_x.dart';
class Counter2X extends StatelessWidget {
   const Counter2X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: GetX<CounterController>(
            builder:(counterController)=> Text( counterController.count.value.toString(),
                style: const TextStyle(fontSize: 30,)),
          ),
        ),
      ),
    );
  }
}
