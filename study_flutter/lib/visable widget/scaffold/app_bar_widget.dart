import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Look at the run to see the different between foregroundColor and backgroundColor
        foregroundColor: Colors.red,
        backgroundColor: Colors.teal,
        title: const Center(child:  Text('AppBar',)),
        leading: const Icon(Icons.car_rental_sharp),
        actions: const [
          Icon(Icons.car_rental_rounded),
          Icon(Icons.car_rental),
          Icon(Icons.car_repair),
        ],
        bottom: PreferredSize(

          child: Text(
            'bottom',
            style: Theme.of(context).textTheme.headline6,
          ),
          preferredSize: const Size(199, 50),
        ),

      ),

    );
  }
}
