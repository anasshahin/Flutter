import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Provider/post_provider.dart'
    as provider1;
import 'package:sdk_09_2021_flutter_firebase/FirebaseFirestoreAndAuth/Example/Provider/post_provider.dart'
    as provider2;
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Route/router.dart'
    as route1;
import 'package:sdk_09_2021_flutter_firebase/FirebaseFirestoreAndAuth/Example/Route/router.dart'
    as route2;
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Router/router.dart' as route3;
import 'FirebaseRealTimeDataBase/Example1/Route/router_constant.dart'
    as constant1;
import 'FirebaseFirestoreAndAuth/Example/Route/router_constant.dart' as constant2;
import 'FirebaseAuth/Router/router_constant.dart' as constant3;

import 'Core/ShareService/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "FlutterAuth",
    options: FirebaseOptions(
        apiKey: "AIzaSyABQazdELjONERS1Kf3-IlmJSexvYbF3bI",
        authDomain: "sdk-09-2021-flutter.firebaseapp.com",
        databaseURL: "https://sdk-09-2021-flutter-default-rtdb.firebaseio.com",
        projectId: "sdk-09-2021-flutter",
        storageBucket: "sdk-09-2021-flutter.appspot.com",
        messagingSenderId: "358886352879",
        appId: "1:358886352879:web:f91b2b77c2bd114981781a",
        measurementId: "G-QLZY8QQ133"
    ),
  );
  await Prefs.init();
  runApp(const FirebaseAuthApp());
}

class RealTimeDatabaseApp extends StatelessWidget {
  const RealTimeDatabaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: provider1.PostProvider()),
      ],
      child: MaterialApp(
        title: 'FlutterAuth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: route1.MyRouter.generateRoute,
        initialRoute: constant1.splashRoute,
      ),
    );
  }
}

class FirestoreApp extends StatelessWidget {
  const FirestoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: provider2.PostProvider()),
      ],
      child: MaterialApp(
        title: 'SDK mini Social App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: route2.MyRouter.generateRoute,
        initialRoute: constant2.splashRoute,
      ),
    );
  }
}

class FirebaseAuthApp extends StatelessWidget {
  const FirebaseAuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SDK mini Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: route3.MyRouter.generateRoute,
      initialRoute: constant3.login,
    );
  }
}


class FirstAppWithFirebase extends StatefulWidget {
  const FirstAppWithFirebase({Key? key}) : super(key: key);

  @override
  _FirstAppWithFirebaseState createState() => _FirstAppWithFirebaseState();
}

class _FirstAppWithFirebaseState extends State<FirstAppWithFirebase> {
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  final name = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();
  String root1 = 'MrRoot';
  String root2 = 'MrRoot/SubRoot';

  @override
  Widget build(BuildContext context) {
    final DatabaseReference databaseReference = firebaseDatabase.ref();
    return Scaffold(
      appBar: AppBar(
        title: Text('First App With Firebase'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('name : '),
                  SizedBox(width: 20),
                  Expanded(child: TextField(controller: name)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('email : '),
                  SizedBox(width: 20),
                  Expanded(child: TextField(controller: email)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('age : '),
                  SizedBox(width: 20),
                  Expanded(child: TextField(controller: age)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('address : '),
                  SizedBox(width: 20),
                  Expanded(child: TextField(controller: address)),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  var userData = <String, dynamic>{};
                  userData['name'] = name.text;
                  userData['email'] = email.text;
                  userData['age'] = age.text;
                  userData['address'] = address.text;
                  var key = databaseReference.push().key;
                  databaseReference
                      .child(root1)
                      .child('userInfo')
                      .child(key!)
                      .set(userData)
                      .whenComplete(() {
                    name.clear();
                    email.clear();
                    age.clear();
                    address.clear();
                  });
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
