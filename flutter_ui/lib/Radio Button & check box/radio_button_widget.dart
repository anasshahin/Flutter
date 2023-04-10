import 'package:flutter/material.dart';
class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _radioVal = 0;
  String ? result ;
  Color ? resultColor;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:const EdgeInsets.all(10),
        child: Column(

          children: [
           const Text('Guess the right answer  4 + 9  : ',
           style: TextStyle(color: Colors.lightBlue,
           fontSize: 27,
           fontWeight: FontWeight.bold)),
            buildRadio('Wrong Answer',3,Colors.red),
            buildRadio('Correct Answer',13,Colors.green),
            buildRadio('Wrong Answer',8,Colors.red),
          ],
        ),
      ),
    );
  }

  createDialog(){
    AlertDialog dialog = AlertDialog(content: SizedBox(height: 100,child: Column(
      children: [
        Text('$result',style: TextStyle(color: resultColor),),
        const Divider(),
        const  SizedBox(height: 18,),
        Text('Answer is 13',style: TextStyle(color: resultColor),)
      ],
    ),),);
    showDialog(context: context, builder: (ctx){return dialog;});
  }
  Row buildRadio(String result,int value,Color resultColor) {
    return Row(children: [Radio(
              value: value, groupValue: _radioVal,
              onChanged: (val){
                setState(() {
                  _radioVal=  val!;
                  this.result= result;
                  this.resultColor = resultColor;
                  createDialog();
                });
              }),
    Text('$value')],
          );
  }
}
