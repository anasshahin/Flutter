import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
class FlushBarWidget extends StatefulWidget {
  const FlushBarWidget({Key? key}) : super(key: key);

  @override
  State<FlushBarWidget> createState() => _FlushBarWidgetState();
}

class _FlushBarWidgetState extends State<FlushBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
     body: Center(
       child: ElevatedButton(
         onPressed: ()=>buildShowFlushBar(context),
         child:const Text('FlushBarWidget show'),),
     ), );
  }

  Future<dynamic> buildShowFlushBar(BuildContext context) {
    return Flushbar(title: 'my first flush bar ',
       duration:const Duration(seconds: 6) ,
       mainButton: OutlinedButton(onPressed: (){Navigator.of(context).pop();},child:const Text('Close')),
       icon:const Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
     flushbarPosition: FlushbarPosition.TOP,
     // message: 'i hope to use flush bar',
       messageText: const Text('i hope to use flush bar',
           style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white54)),).show(context);
  }
}

