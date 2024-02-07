import 'package:flutter/material.dart';

import 'counter1.dart';
import 'counter2.dart';
import 'counter3.dart';


class DashboardX extends StatelessWidget {
  const DashboardX({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 20,
      child: Container(
        height:400,
        width:400,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black)],
        ),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:  [
            const Text("Dashboard",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.center ,
                children:
             [
              Expanded(child: Counter1X( )), 
              const SizedBox(width: 20,),
              const Expanded(child: Counter2X( )),
               const SizedBox(width: 20,),
               Expanded(child: Counter3X())
            ]),
          ],

        ),
      ),
    );
  }
}
