import 'package:flutter/material.dart';

class MyTextButtonWidget extends StatefulWidget {
  @override
  _MyTextButtonWidgetState createState() => _MyTextButtonWidgetState();
}

class _MyTextButtonWidgetState extends State<MyTextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
      ),
      body: Center(
        child: TextButton(
            child: Text('Text Button'),
            style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                  width: 4,
                  color: Colors.red,
                )),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                foregroundColor: MaterialStateProperty.all(Colors.purple),
                // backgroundColor:  MaterialStateProperty.all(Colors.amber),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
            onPressed: () {
              print('Click');
            }),
      ),
    );
  }
}
