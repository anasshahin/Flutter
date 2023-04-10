import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cart_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/category_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/orders_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/prodect_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/user_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Prefs.init();
  ThemeManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: OrdersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ThemeManager.appName,
        theme: ThemeManager.appTheme,
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: initRoute,
      ),
    );
  }
}
