import 'package:flutter/material.dart';

class ScreenTwoPop extends StatelessWidget {


  const ScreenTwoPop( {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwo'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: const [

            Text('go to screen one ',
              style: TextStyle(fontSize: 35,
                fontFamily: 'Julee Regular',),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> Navigator.of(context).pop('my name is anas shahin'),
        child: const Icon(Icons.delete_outline),
      ),
    );
  }
}
