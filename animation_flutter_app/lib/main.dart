import 'dart:math';

import 'package:animation_flutter_app/Basics/01_animated_container.dart';
import 'package:flutter/material.dart';

import 'Basics/02_page_route_builder.dart';
import 'Basics/03_animation_controller.dart';
import 'Basics/04_tweens.dart';
import 'Basics/05_animated_builder.dart';
import 'Basics/06_custom_tween.dart';
import 'Basics/07_tween_sequence.dart';
import 'Basics/08_fade_transition.dart';
import 'misc/animated_list.dart';
import 'misc/animated_positioned.dart';
import 'misc/animated_switcher.dart';
import 'misc/card_swipe.dart';
import 'misc/carousel.dart';
import 'misc/curved_animation.dart';
import 'misc/expand_card.dart';
import 'misc/focus_image.dart';
import 'misc/hero_animation.dart';
import 'misc/physics_card_drag.dart';
import 'misc/repeating_animation.dart';

void main() {
  runApp(MyApp());
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  Demo({@required this.name, @required this.route, @required this.builder});
}

final basicsDemo = [
  Demo(name: 'AnimatedContainer', route: AnimatedContainerDemo.routeName, builder: (context) => AnimatedContainerDemo()),
  Demo(name: 'PageRouteBuilder', route: PageRouteBuilderDemo.routeName, builder: (context) => PageRouteBuilderDemo()),
  Demo(name: 'AnimationController', route: AnimationControllerDemo.routeName, builder: (context) => AnimationControllerDemo()),
  Demo(name: 'TweenDemo', route: TweenDemo.routeName, builder: (context) => TweenDemo()),
  Demo(name: 'AnimatedBuilderDemo', route: AnimatedBuilderDemo.routeName, builder: (context) => AnimatedBuilderDemo()),
  Demo(name: 'CustomTweenDemo', route: CustomTweenDemo.routeName, builder: (context) => CustomTweenDemo()),
  Demo(name: 'TweenSequenceDemo', route: TweenSequenceDemo.routeName, builder: (context) => TweenSequenceDemo()),
  Demo(name: 'FadeTransitionDemo', route: FadeTransitionDemo.routeName, builder: (context) => FadeTransitionDemo()),
];

final miscDemos = [
  Demo(
      name: 'Expandable Card',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Card Swipe',
      route: CardSwipeDemo.routeName,
      builder: (context) => CardSwipeDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationDemo()),
  Demo(
      name: 'Spring Physics',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()),
  Demo(
      name: 'AnimatedList',
      route: AnimatedListDemo.routeName,
      builder: (context) => AnimatedListDemo()),
  Demo(
      name: 'AnimatedPositioned',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => AnimatedPositionedDemo()),
  Demo(
      name: 'AnimatedSwitcher',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => AnimatedSwitcherDemo()),
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => HeroAnimationDemo()),
  Demo(
      name: 'Curved Animation',
      route: CurvedAnimationDemo.routeName,
      builder: (context) => CurvedAnimationDemo()),
];


final basicsDemoRoutes = Map.fromEntries(basicsDemo.map((e) => MapEntry(e.route, e.builder)));
final miscDemoRoutes = Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String,WidgetBuilder>{
  ...basicsDemoRoutes,
  ...miscDemoRoutes,
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicsDemo.map((d) => DemoTile(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
class DemoTile extends StatelessWidget {
  final Demo demo;
  DemoTile(this.demo);
  @override
  Widget build(BuildContext context) {
    final itemStyle = Theme.of(context).textTheme.bodyText1;
    final color = generateColor();
    return ListTile(
      title: Text(demo.name,style: itemStyle,),
      trailing: Icon(Icons.tab),
      tileColor: color,
      onTap: (){
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}


