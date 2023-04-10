import 'package:flutter/material.dart';
class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool python = false;
  bool js = false;
  bool cPlus = false;
  bool dart = false;

  String get str {
    String str = 'You select : \n';
    if (python) str+='Python\n';
    if (js) str+='JS\n';
    if (cPlus) str+='C++\n';
    if (dart) str+='Dart\n';
   if ('You select : '== str) str+= 'None';
    return str;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: buildCheckBox(context),
    );
  }

  Padding buildCheckBox(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(22),
      child: Column(
        children: [
          const Text('select all programming language that you know : '),
          Row(
            children: [
              Checkbox(
                value:js , onChanged: (bool? value) {
                setState(() {
                  js = value!;
                });
              },),
             const Text('JS'),
            ],
          ),
          CheckboxListTile(title:const Text('C++') ,value: cPlus,
              onChanged:(val){
            setState(() {
              cPlus = val!;
            });
          },contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading),
          CheckboxListTile(title:const Text('Python') ,value: python,
              onChanged:(val){
                setState(() {
                  python = val!;
                });
              },
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading),
          CheckboxListTile(title:const Text('Dart') ,value: dart,
              onChanged:(val){
                setState(() {
                  dart = val!;
                });
              },
            contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,),
          ElevatedButton(onPressed: (){
            AlertDialog dialog = AlertDialog(title:const Text('This is your programming language that you know :'),
            content:Text(str) );
            showDialog(context: context, builder: (_){return dialog;});
          }, child:const Text('Show result'))
        ],

      ),
    );
  }
}
