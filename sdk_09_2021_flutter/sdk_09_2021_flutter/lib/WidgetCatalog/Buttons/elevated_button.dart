import 'package:flutter/material.dart';

class MyElevatedButtonWidget extends StatefulWidget {
  @override
  _MyElevatedButtonWidgetState createState() => _MyElevatedButtonWidgetState();
}

class _MyElevatedButtonWidgetState extends State<MyElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElevatedButton'),
      ),
      body: Center(
        child: ElevatedButton(
          onLongPress: (){
            print('Long Press');
          },
          style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                width: 4,
                color: Colors.brown,
              )),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
              backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 30, color: Colors.red))),
          onPressed: () {
            print('Click');
          },
          child: Text('Elevated Button',),
        ),
      ),
    );
  }
}
