import 'package:flutter/material.dart';
import 'package:state_management_project/Provider/Simple%20example/counter1.dart';
import 'package:state_management_project/Provider/Simple%20example/counter2.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key,}) : super(key: key);

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
        child: const Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:  [
            Text("Dashboard",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.center ,
                children:
            [
              Counter1( ),
              SizedBox(width: 20,),
              SizedBox(width: 20,),
              Counter2( ),
            ]),
          ],

        ),
      ),
    );
  }
}
