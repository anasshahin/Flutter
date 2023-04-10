import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/WidgetCatalog/Utils/random_color.dart';

class GirdViewWidgetBuilder extends StatelessWidget {
  const GirdViewWidgetBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View - Builder'),
      ),
      body: GridView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return items[index];
        },
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            // childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

List<GridListItems> items = [
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Bicycle',
      icon: Icons.directions_bike),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Boat',
      icon: Icons.directions_boat),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Bus',
      icon: Icons.directions_bus),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Train',
      icon: Icons.directions_railway),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Walk',
      icon: Icons.directions_walk),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Contact',
      icon: Icons.contact_mail),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Bicycle',
      icon: Icons.directions_bike),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Boat',
      icon: Icons.directions_boat),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Bus',
      icon: Icons.directions_bus),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Train',
      icon: Icons.directions_railway),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Walk',
      icon: Icons.directions_walk),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Contact',
      icon: Icons.contact_mail),
  GridListItems(
      color: Colors.green, title: 'Bicycle', icon: Icons.directions_bike),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Boat',
      icon: Icons.directions_boat),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Bus',
      icon: Icons.directions_bus),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Train',
      icon: Icons.directions_railway),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Walk',
      icon: Icons.directions_walk),
  GridListItems(
      color: RandomColor.generateColor(),
      title: 'Contact',
      icon: Icons.contact_mail),
];

class GridListItems extends StatelessWidget {
  const GridListItems(
      {Key? key, required this.color, required this.title, required this.icon})
      : super(key: key);
  final Color color;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

