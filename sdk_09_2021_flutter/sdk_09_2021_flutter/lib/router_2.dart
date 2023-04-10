import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_one.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_three.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_two.dart';
import 'package:sdk_09_2021_flutter/wrong_route.dart';
import 'Routes/constant_routes.dart';

class MyRoute2 {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case s1Route:{
        return MaterialPageRoute(builder: (_) => NavigationScreenOne());
      }

      case s2Route:{
        final arg = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => NavigationScreenTwo(
          argument: arg,
        )
        );
      }

      case s3Route:{
        return MaterialPageRoute(builder: (_) => NavigationScreenThree());
      }

      default:
        {
          final arg = settings.name as String;
          return MaterialPageRoute(
              builder: (_) => UndefineRoute(routeName: arg));
        }
    }
  }
}
