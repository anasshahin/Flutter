import 'package:flutter/material.dart';

class FutureBuilderEX extends StatefulWidget {
  const FutureBuilderEX({Key? key}) : super(key: key);

  @override
  State<FutureBuilderEX> createState() => _FutureBuilderEXState();
}
/*final Future<int> x4 = Future.delayed(Duration(seconds: 2),
          (){return 5;});
  x4.then((value) => print(value));*/

class _FutureBuilderEXState extends State<FutureBuilderEX> {

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      initialData: 'demo',
      future:   Future.delayed(const Duration(seconds: 2), ()=>5),
        builder:(ctx,snapShot){
      return Scaffold(
        appBar: AppBar(title: Text( snapShot.data.toString() ),),
        body: Center(
          child:snapShot.connectionState == ConnectionState.done?
          Text('hello world '+snapShot.data.toString()): const CircularProgressIndicator(),
          // or  snapShot.hasData? Text('hello world '+snapShot.data.toString()): const CircularProgressIndicator(),
        ),
      );
    } );
  }
}
