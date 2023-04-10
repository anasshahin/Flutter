import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_flutter/Navigation/NavigationOne/lib_organizer.dart';
import 'package:sdk_09_2021_flutter/StateManagment/Providers/Models/my_model2.dart';
import 'package:sdk_09_2021_flutter/StateManagment/Providers/Models/my_model_4.dart';
import 'package:sdk_09_2021_flutter/router.dart';
import 'package:sdk_09_2021_flutter/router_2.dart';
import 'Animation/implecit_animation.dart';
import 'Futuers/stream_builder_widget.dart';
import 'JSON/ComplexJSON/Screens/json_screen_1.dart';
import 'JSON/ComplexJSON/Screens/json_screen_2.dart';
import 'JSON/ComplexJSON/Screens/json_screen_3.dart';
import 'Navigation/NaigationTwo/theme.dart';
import 'Routes/constant_routes.dart';
import 'StateManagment/Providers/Models/my_model.dart';
import 'StateManagment/Providers/Models/my_model_3.dart';
import 'StateManagment/Providers/future_provider.dart';
import 'StateManagment/Providers/multiple_provider.dart';
import 'StateManagment/Providers/multiple_provider_with_only_future.dart';
import 'StateManagment/Providers/proxy_provider.dart';
import 'StateManagment/Providers/simple_provider.dart';
import 'StateManagment/Providers/simple_provider_2.dart';
import 'StateManagment/SharedPerfreances/ExampleOne/Service/session_manager.dart';
import 'StateManagment/SharedPerfreances/ExampleOne/router.dart';
import 'StateManagment/SharedPerfreances/ExampleOne/router_constant.dart';
import 'WidgetCatalog/Scoffold/scaffold_widget.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK 9 2021 Flutter',
      // theme: getMyTheme(context),
      home: AnimationPage(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK 9 2021 Flutter',
      theme: getMyTheme(context),
      home: WelcomePage(),
      routes: {
        '/loginRoute': (context) => SignInPage(),
        '/registerRoute': (context) => RegisterPage(),
      },
    );
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK 9 2021 Flutter',
      onGenerateRoute: MyRoute2.generateRoute,
      initialRoute: s1Route,
    );
  }
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK 9 2021 Flutter',
      theme: theme(),
      onGenerateRoute: MyRoute.generateRoute,
      initialRoute: splashRoute,
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage(this.txt);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(txt);
  }
}

class SharedPreferencesApp extends StatelessWidget {
  const SharedPreferencesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK 9 2021 Flutter',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: MyRoute3.generateRoute,
      initialRoute: welcomePageRoute,
    );
  }
}

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      //    <--- Provider
      create: (context) => MyModel(),
      child: MaterialApp(home: SimpleProviderTwo()),
    );
  }
}

class MyProviderApp2 extends StatelessWidget {
  const MyProviderApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel2>(
          create: (context) => MyModel2(someValue: 'default Value'),
        )
      ],
      child: MaterialApp(
        home: MultipleProviderWithFutureExample(),
      ),
    );
  }
}

class MyMultipleProviderApp extends StatelessWidget {
  const MyMultipleProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //        <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel3>(create: (context) => MyModel3()),
        ChangeNotifierProvider<AnotherModel>(
            create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        home: MultipleProviderExample(),
      ),
    );
  }
}

class MyProxyProviderApp extends StatelessWidget {
  const MyProxyProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //        <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel4>(create: (context) => MyModel4()),
        ProxyProvider<MyModel4, AnotherModel2>(            //          <--- ProxyProvider
        update: (context, myModel4, anotherModel2) => AnotherModel2(myModel4),
        ),
      ],

      child: MaterialApp(
        home: ProxyProviderExample(),
      ),
    );
  }
}
