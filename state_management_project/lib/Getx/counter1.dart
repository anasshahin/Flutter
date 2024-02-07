import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_get_x.dart';
class Counter1X extends StatelessWidget {
    Counter1X({Key? key,}) : super(key: key);
   final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: GetBuilder<CounterController>(init: _counterController,
              builder:(_)=> Text(_counterController.counter.toString(),style: const TextStyle(fontSize: 30,))),
        ),
      ),
    );
  }
}
