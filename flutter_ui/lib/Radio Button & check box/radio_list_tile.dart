import 'package:flutter/material.dart';
class RadioListTileWidget extends StatefulWidget {
  const RadioListTileWidget({Key? key}) : super(key: key);

  @override
  State<RadioListTileWidget> createState() => _RadioListTileWidgetState();
}

class _RadioListTileWidgetState extends State<RadioListTileWidget> {

  int valueGroup=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        color: valueGroup==1?Colors.blueGrey:Colors.lightGreenAccent,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            RadioListTile(controlAffinity : ListTileControlAffinity.platform // change the sequence between the text and radio
                ,title:const Text('Green') , subtitle: const Text('is this ahmad favourite color'), value:0 , groupValue:valueGroup ,// common value between all Radio
                onChanged: (val){
              setState(() => valueGroup = val!);}),
            RadioListTile(controlAffinity: ListTileControlAffinity.platform,title:const Text('Blue') , subtitle: const Text('is this ahmad favourite color'), value:1 , groupValue:valueGroup ,
                onChanged: (val){
                  setState(() => valueGroup = val!);},
            ),
          ]),
        ),
      ),
    );
  }
}
