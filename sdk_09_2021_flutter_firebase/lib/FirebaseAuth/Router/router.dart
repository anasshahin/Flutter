import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Router/router_constant.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Router/un_define_view.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Screen/home_profile.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Screen/image_viewer_screen.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Screen/sign_in_scree.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Screen/sign_up_screen.dart';

import '../Screen/profile_with_facebook.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        {
          return _route(SignInScreen());
        }

      case profileWithFacebook:
        {
          final arg = settings.arguments as String;
          return _route(ProfileWithFacebook(userEmail: arg,));
        }
      case signUp:
        {
          return _route(SignUpScreen());
        }

      case imageViewer:
        {
          final arg = settings.arguments as String;
          return _route(ImageViewerScreen(imageUrl: arg));
        }

      case homeRote:
        {
          final arg = settings.arguments as String;
          return _route(HomeProfileScreen(uid: arg));
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
