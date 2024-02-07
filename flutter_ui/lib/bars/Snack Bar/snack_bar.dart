import 'package:flutter/material.dart';

class SnackBarWidget extends StatefulWidget {
 const  SnackBarWidget({Key? key}) : super(key: key);

  @override
  State<SnackBarWidget> createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget> {
String title = ' SnackBar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child:const  Text('show SnackBar'),
          onPressed: () {
            setState(() {
              title='';
            });
            viewSnackBarWid(context);
          },
        ),
      ),
    );
  }

  void viewSnackBarWid(BuildContext context) {
    SnackBar sBar =
         SnackBar(content: const Text('hello flutter developer'),
           action: SnackBarAction(
             onPressed: (){
               setState(() {
                 title = 'show SnackBar';
               });
             },
             label: 'reverse',
         ),
        backgroundColor: Colors.blueGrey,
          duration:const Duration(seconds: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
           margin: const EdgeInsets.all(15),
           behavior: SnackBarBehavior.floating,
           // it is by default fixed
           // i put it floating to make margin
        );
    ScaffoldMessenger.of(context).showSnackBar(sBar);
  }
}
