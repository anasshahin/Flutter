import 'package:flutter/material.dart';

class MyButtonAction extends StatefulWidget {
  @override
  _MyButtonActionState createState() => _MyButtonActionState();
}

class _MyButtonActionState extends State<MyButtonAction> {
  var isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Action Button'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isChange = !isChange;
                  });
                },
                child: Text(
                  'Click',
                  style: TextStyle(fontSize: 24),
                )),
            isChange
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Icon(Icons.camera_enhance),
                        Icon(Icons.camera_front),
                        Icon(Icons.camera_rear),
                      ])
                : TextButton(
                    child: Text('Text Button'),
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(
                          width: 4,
                          color: Colors.red,
                        )),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        // backgroundColor:  MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: () {
                      print('Click');
                    }),
          ],
        )));
  }
}
