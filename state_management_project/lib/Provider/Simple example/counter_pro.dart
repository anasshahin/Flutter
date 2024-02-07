import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/Provider/Simple%20example/dashboard.dart';
import 'package:state_management_project/Provider/Simple%20example/my_provider.dart';

class CounterPro extends StatelessWidget {
  const CounterPro({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar() ,
      body: const Center(
        child: Dashboard( ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<MyProvider>(context,listen: false).increment();
        },
      ),
    );
  }
}
