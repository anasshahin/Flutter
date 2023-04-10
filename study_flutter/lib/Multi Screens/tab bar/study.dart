import 'package:flutter/material.dart';
class Study extends StatelessWidget {
  const Study({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(Icons.library_books_outlined,color: Colors.blue,size: 50,)),
    );
  }
}
