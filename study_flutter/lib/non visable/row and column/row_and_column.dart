import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  const RowAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RowAndColumn'),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:  [
            const Text('Text1Text1Text1Text1',
                style: TextStyle(color: Colors.yellow, fontSize: 15)),
            const Text(
              'Text2',
              style: TextStyle(color: Colors.yellow, fontSize: 15),
            ),
            Container(
              width: 200,
              color: Colors.green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Text1',),
                  Icon(Icons.car_repair,size: 50,),
                  Text('Text1',),
                  Text('Text1',),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
