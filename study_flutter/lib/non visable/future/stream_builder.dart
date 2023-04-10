import 'package:flutter/material.dart';
class StreamBuilderEX extends StatefulWidget {
  const StreamBuilderEX({Key? key}) : super(key: key);

  @override
  State<StreamBuilderEX> createState() => _StreamBuilderEXState();
}
/*final x3 = Stream.periodic(Duration(milliseconds: 500),(int x)=> x );
final x4=x3.where((event) => event<20 && event > 4);
x4.listen((event) {print(event);});*/
class _StreamBuilderEXState extends State<StreamBuilderEX> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      initialData: 0,
      stream: Stream.periodic(const Duration(seconds: 1),(int x)=> x ),
      builder: (ctx,snapShot){
      return Scaffold(
        appBar: AppBar(title: Text(snapShot.data.toString())),
        body: Center(child:snapShot.connectionState == ConnectionState.waiting? const CircularProgressIndicator():Text(snapShot.data.toString())),
      );
    },);
  }
}
