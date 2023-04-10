import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Models/user_model.dart';
import 'package:sdk_09_2021_flutter/wrong_route.dart';
import 'router_constant.dart';
import 'lib_organizer.dart';

class MyRoute3 {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePageRoute:
        {
          return _route(WelcomePage());
        }

      case sigInPageRoute:
        {
          return _route(SignInPage());
        }

      case sigUpPageRoute:
        {
          return _route(RegisterPage());
        }

      case HomePageRoute:
        {
          final arg = settings.arguments as UserModel;
          return _route(HomePage(
            userModel: arg,
          ));
        }

      default:
        {
          final arg = settings.name as String;
          return _route(UndefineRoute(routeName: arg));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
