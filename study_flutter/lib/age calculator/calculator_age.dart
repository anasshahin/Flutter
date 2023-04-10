import 'package:flutter/material.dart';
class CalculatorAge extends StatefulWidget {
  const CalculatorAge({Key? key}) : super(key: key);

  @override
  State<CalculatorAge> createState() => _CalculatorAgeState();
}

class _CalculatorAgeState extends State<CalculatorAge> {
  TextEditingController ageController=TextEditingController();
  int myAge=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('CalculatorAge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
           Container(
             margin: const EdgeInsets.all(10),
             child:  TextField(
               keyboardType: TextInputType.phone,
               controller: ageController,
               decoration: InputDecoration(

                 icon: const Icon(Icons.calendar_month),
                 focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(4),
                   borderSide:  const BorderSide(
                     color: Colors.green,
                     width: 4,
                   ),
                 ),
               ) ,
             ),
           ),
            Container(
              margin: const EdgeInsets.all(10),
               height: 200,
              width: 300,
              alignment:Alignment.center ,
              child: Text('your age is $myAge',),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(4) ,
                border: Border.all(color: Colors.green,width: 4,),
                color: Colors.greenAccent
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                myAge = DateTime.now().year - int.parse(ageController.text);
              });
            }, child: const Text('Calculate your age'))
          ],
        ),
      ),
    );
  }
}
