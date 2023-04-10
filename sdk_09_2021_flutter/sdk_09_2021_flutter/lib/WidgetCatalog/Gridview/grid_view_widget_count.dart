import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/WidgetCatalog/Utils/random_color.dart';

class GridViewWidgetCount extends StatefulWidget {
  const GridViewWidgetCount({Key? key}) : super(key: key);

  @override
  _GridViewWidgetCountState createState() => _GridViewWidgetCountState();
}

class _GridViewWidgetCountState extends State<GridViewWidgetCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View - Count'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        // childAspectRatio: (2 / 1),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        //physics:BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        children: items,
        scrollDirection: Axis.horizontal,
      ),
    );
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
}

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
