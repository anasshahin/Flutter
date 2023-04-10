import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateTimeFormatEX extends StatelessWidget {
  const DateTimeFormatEX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('hello world my name is anas',style: TextStyle(fontFamily: 'Passions Conflict',fontSize: 30)),
            Text(DateFormat.yMMMd().format(DateTime.now())+'  hello',
              style: const TextStyle(fontSize:30,color: Colors.blueGrey,fontFamily: 'Julee Regular'),),
            Text(DateFormat('yyyy/mm/dd').format(DateTime.now())+'  hello',
              style: const TextStyle(fontSize:30,color: Colors.blueGrey,fontFamily: 'Julee Regular'),),
            Text(DateFormat().format(DateTime.now())+'  hello',
              style: const TextStyle(fontSize:30,color: Colors.blueGrey,fontFamily: 'Passions Conflict'),)
          ],
        ),
      ),
    );
  }
}
