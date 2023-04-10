import 'package:flutter/material.dart';
class AsyncAwaitEX extends StatefulWidget {
  const AsyncAwaitEX({Key? key}) : super(key: key);

  @override
  State<AsyncAwaitEX> createState() => _AsyncAwaitEXState();
}

class _AsyncAwaitEXState extends State<AsyncAwaitEX> {
  Stream<int> getStreamData(){
    Stream<int>  streamData = Stream.periodic(const Duration(seconds: 1),(int x)=> x );
    return streamData;
  }
  int number=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('$number'),),
      body: Center(
        child: ElevatedButton(
          child: Text('$number'),
          onPressed: () async{
           await for(int i in getStreamData()){
             setState(() {
               number = i;
             });
            }
          },
        ),
      ),
    );
  }
}
