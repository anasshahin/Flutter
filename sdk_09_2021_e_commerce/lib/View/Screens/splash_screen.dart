import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/home_screen.dart';
import '../../core/session_manager.dart';
import 'Auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeManager.lightPrimary,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Lottie.asset('assets/row/ecommerce_logo.json'),
          ),
          // CircularProgressIndicator(),
          SpinKitDoubleBounce(
            color: Colors.green,
            size: 50.0,
          ),
          SizedBox(height: 5,),
          Expanded(
            flex: 1,
            child: AnimatedSplashScreen.withScreenFunction(
              splash: 'assets/Account/Icon_Cart.png',
              splashIconSize: 0,
              backgroundColor: ThemeManager.lightPrimary,
              screenFunction: () async {
                var loginState = Prefs.getBooleanValue('loginState') ?? false;
                await delay();
                if (loginState) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              },
              splashTransition: SplashTransition.fadeTransition,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> delay() async {
  Future.delayed(Duration(seconds: 5));
}
