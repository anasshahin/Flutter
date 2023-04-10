import 'package:flutter/material.dart';
class ResultBMI extends StatelessWidget {
 const  ResultBMI({Key? key,required this.age,required this.gender,
     required this.healthStatus,required this.result,required this.height}) : super(key: key);
 final String gender;
   final double age;
   final String result;
   final String healthStatus;
   final double height;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('ResultBMI'),
          backgroundColor: Colors.greenAccent
      ),
      body: SafeArea(// its works to handel size problem between
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
          child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Gender : '+gender,),
                Text('Result : '+result,),
                Text('HealthStatus : '+healthStatus,),
                Text('Age : '+age.toString(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
