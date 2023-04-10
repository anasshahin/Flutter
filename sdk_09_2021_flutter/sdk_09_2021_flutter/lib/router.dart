import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/cart/cart_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/home/home_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/login_success/login_success_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/sign_in/sign_in_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/sign_up/sign_up_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NaigationTwo/screens/splash/splash_screen.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_one.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_three.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationPushNamed/screen_two.dart';
import 'package:sdk_09_2021_flutter/wrong_route.dart';
import 'Routes/constant_routes.dart';

class MyRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      case signInRoute:
        {
          return MaterialPageRoute(builder: (_) => SignInScreen());
        }
      case signUpRoute:
        {
          return MaterialPageRoute(builder: (_) => SignUpScreen());
        }
      case loginSuccessRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginSuccessScreen());
        }
      case homeRoute:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }

        case cartRoute:
        {
          return MaterialPageRoute(builder: (_) => CartScreen());
        }

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
