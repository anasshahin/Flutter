import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

import 'home controller/home_contoller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( );
  //final fcmToken = await FirebaseMessaging.instance.getToken();
  AwesomeNotifications().initialize(null,
  [
    NotificationChannel(channelKey: 'Dangerous', channelName: 'Dangerous', channelDescription: 'One of child is near kitchen'),
  ],
    debug: true,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  LedControl(),
    );

  }
}

