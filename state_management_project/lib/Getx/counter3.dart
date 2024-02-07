import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_get_x.dart';

class Counter3X extends StatelessWidget {
   Counter3X({Key? key}) : super(key: key);
  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(50),
        child:  Center(
          child: Obx(
              ()=> Text( _counterController.count.value.toString(),
                style: const TextStyle(fontSize: 30,)),
          ),
        ),
      ),
    );
  }
}
