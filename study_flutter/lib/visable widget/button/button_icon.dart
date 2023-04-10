
import 'package:flutter/material.dart';
class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({Key? key}) : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  adder (int number1 , int number2)
  {return print(number1+number2);}
  adder1 ()
  {return print(5+8);}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Icon-button')),
      body: Center(
        child: Column(
          children: [
            IconButton(onPressed: (){
              print('hello');
            }, icon: const Icon(Icons.ac_unit)),
            IconButton(onPressed: ()=>adder(2,4), icon: const Icon(Icons.ac_unit)),
            IconButton(onPressed: adder1, icon: const Icon(Icons.ac_unit)),
          ],
        ),
      ),

    );
  }
}
