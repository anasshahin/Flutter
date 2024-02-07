import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_project/Getx/my_get_x.dart';

import 'dashboard.dart';

class CounterXPro extends StatelessWidget {
   CounterXPro({super.key});

final CounterController _counterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar() ,
      body: const Center(
        child: DashboardX( ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counterController.increment();
          _counterController.incrementRx();
        },
      ),
    );
  }
}
