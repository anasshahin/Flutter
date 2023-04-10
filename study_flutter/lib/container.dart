import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Look at the run to see the different between foregroundColor and backgroundColor
        foregroundColor: Colors.red,
        backgroundColor: Colors.teal,
        title: const Center(
            child: Text(
          'AppBar',
        )),
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
      body: Container(
        // try to delete child to see what will happen
        child: const Text('work hard'),

        color: Colors.red,
      ),
    );
  }
}
class ContainerWidgetEX1 extends StatelessWidget {
  const ContainerWidgetEX1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('work hard'),
              Text('work hard'),
              Text('work hard'),
            ],
          ),
        ),
      ),
    );
  }
}
class ContainerWidgetEX2 extends StatelessWidget {
  const ContainerWidgetEX2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('work hard'),
              Text('work hard'),
              Text('work hard'),
            ],
          ),
        ),
      ),
    );
  }
}

