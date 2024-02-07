import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ExpandableListWidget extends StatefulWidget {
  const ExpandableListWidget({Key? key}) : super(key: key);

  @override
  State<ExpandableListWidget> createState() => _ExpandableListWidgetState();
}

class _ExpandableListWidgetState extends State<ExpandableListWidget> {
  String  title='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildExpansionTile(context),
    );
  }

  ListView buildExpansionTile(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTile(
              leading: const Icon(Icons.perm_identity),
              backgroundColor: Colors.grey,

              title: const Text('Account'),
            children: [
              const  Divider(color: Colors.grey,),
              Card(
                color: Colors.blueGrey,
                child: ListTile(
                  leading:const Icon(Icons.add),
                  trailing:const Icon(Icons.arrow_forward_ios),
                  title:const Text('Sign Up'),
                  subtitle:const Text('Sign up for Gmail, create a Google Account.'),
                  onTap:(){
                    buildShowFlushBar(context);
                  },),
              ),
              Card(
                color: Colors.blueGrey,
                child: ListTile(
                  leading:const Icon(Icons.account_circle),
                  trailing:const Icon(Icons.arrow_forward_ios),
                  title:const Text('Sign In'),
                  subtitle:const Text('Sign in for Gmail '),
                  onTap:(){
                    viewSnackBarWid(context);
                  },),
              ),

            ],
        ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTile(
              leading: const Icon(Icons.message),

              title: const Text('MoreInfo'),
              backgroundColor: Colors.grey,
              children: [

                Card(
                  color: Colors.blueGrey,
                  child: ListTile(

                    leading:const Icon(Icons.phone),
                    trailing:const Icon(Icons.arrow_forward_ios),
                    title:const Text('Sign In'),
                    subtitle:const Text('Sign in for Gmail '),
                    onTap:(){
                      viewSnackBarWid(context);
                    },),
                ),

              ],
            ),
          ),

        ]
    );
  }

  dynamic buildShowFlushBar(BuildContext context) {
    return Flushbar(title: 'my first flush bar ',
      duration:const Duration(seconds: 6) ,
      mainButton: OutlinedButton(onPressed: (){Navigator.of(context).pop();},child:const Text('Close')),
      icon:const Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
      flushbarPosition: FlushbarPosition.TOP,
       message: 'i hope to use flush bar',
      messageText: const Text('i hope to use flush bar',
          style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white54)),).show(context);
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
