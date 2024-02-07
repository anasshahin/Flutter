import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/Getx/my_get_x.dart';
import 'package:state_management_project/Provider/Simple%20example/my_provider.dart';
import 'package:http/http.dart' as http;

import 'Provider/App theme/app_theme_widget.dart';
import 'Provider/App theme/provider_model.dart';
import 'Provider/Provider type/counter_ui.dart';
import 'Provider/Provider type/model_type.dart';
import 'Provider/Simple example/counter_pro.dart';
import 'WidgetLifeSycle/widget_life_sycle.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  DatabaseReference  database = FirebaseDatabase.instance.ref();
database.child("Product").push().set({'id':10});

const String urlString ="https://my-bees-40070-default-rtdb.firebaseio.com/app.json";
 final Uri url = Uri.parse(urlString);
http.post(url ,body: json.encode({
  "id":1,
  "title":"my title",
  "body":"my body",

}));
  // can put ChangeNotifierProvider here
  /// use it when want to use MyAppTheme
  /*runApp(ChangeNotifierProvider<ProviderModel>(
    create: (_)=>ProviderModel(),
    child: const
    MyAppTheme(),
  ));*/


  /// use  when want to use multiple provider in the app
  /*
   runApp(MultiProvider(providers: [
  ChangeNotifierProvider<ProviderModel>(create: (_)=>ProviderModel(),
  child:const MyAppTheme(),),
  ]
  ));
  */

  runApp(const MyAppTypeProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MyProvider>(// must put ChangeNotifierProvider in MaterialApp
        create: (_)=>MyProvider(),
        child: const CounterPro(),
      )

    ,
    );
  }
}
class GetXMain extends StatelessWidget {
  const GetXMain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetLifeCycle(),
      );


  }
}
class MyAppTheme extends StatelessWidget {
  const MyAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',
        themeMode: Provider.of<ProviderModel>(context).themeMode,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(primarySwatch:  Colors.brown,),
        home: const AppThemeWidget());}
}

class MyAppTypeProvider extends StatelessWidget {
  const MyAppTypeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ModelTypeProvider>(// must put ChangeNotifierProvider in MaterialApp
        create: (_)=>ModelTypeProvider(),
        child: const CounterProvider(),
      )

      ,
    );
  }
}




