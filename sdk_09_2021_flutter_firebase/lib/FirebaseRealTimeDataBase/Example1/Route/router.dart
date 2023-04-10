import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Route/router_constant.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Route/un_define_view.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Screen/add_edit_post_screen.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Screen/home_screen.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Screen/splash_screen.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splashRoute:{
        return _route(SplashScreen());
      }

      case homeRote:
        {
          return _route(PostHomeScreen());
        }

      case addEditPostRoute:
        {
          final arg = settings.arguments as String;
          return _route(AddEditPostScreen(
            postId: arg,
          ));
        }

      default:
        {
          final arg = settings.name as String;
          return _route(UnDefineView(
            routeName: arg,
          ));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
