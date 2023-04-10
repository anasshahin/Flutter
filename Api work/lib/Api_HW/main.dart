// import 'dart:convert';
// import 'package:flutter_post_app/post_model_Notwork.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../HW_ecommerce/forgot_email_and_password.dart';
import '../HW_solution/home page/home_page_screen.dart';
import '../workexample.dart';
import 'LoginPage/LoginPage.dart';
import 'ScreenTwo/secreen_two.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  ForgotDataUser()
    );
  }
}
// this MyHomePage not work
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Future<Post> futurePost;
//
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: FutureBuilder<Post>(
//             future: futurePost,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (!snapshot.hasData) {
//                 return Text(snapshot.error.toString());
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               else{
//                 return ListView.builder(
//                   padding: EdgeInsets.all(8),
//                   itemCount: snapshot.data.lenght,
//                     itemBuilder: (BuildContext context, int index){
//                     return  Card(
//                       child: Column(
//                         children: <Widget>[
//                           ListTile(
//                             leading: Image.network(snapshot.data['image'],width: 50,height: 50,),
//                             title: Text(snapshot.data['text']),
//                             subtitle: Text(snapshot.data['publishDate']),
//                             trailing: Text(snapshot.data['publishDate']),
//                           )
//                         ],
//                       ),
//                     );
//                     }
//                 );
//               }
//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ) // This trailing comma makes auto-formatting nicer for build methods.
//         );
//   }
//
//   Future<Post> fetchPost() async {
//     final response = await http.get(
//         Uri.parse('https://dummyapi.io/data/api/post'),
//         headers: {"app-id": "60a65d40d543e116a9221d82"});
//     final responseJson = response.body;
//     print("====response ${response.body.toString()}");
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       print(responseJson.length);
//       return Post.fromJson(json.decode(responseJson));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//     // }
//     // return Post.fromJson(jsonDecode(response.title));
//   }
//
//   /*
//   Future<Post> fetchPost() async {
//     final response = await http
//         .get(Uri.parse('https://dummyapi.io/data/api/post'), headers: {
//       "app-id": "60a373f57c13e7f5a901a999"
//     }).then((http.Response response) {
//       final int statusCode = response.statusCode;
//       print("====response ${response.body.toString()}");
//
//       if (response.statusCode == 200) {
//         // If the server did return a 200 OK response,
//         // then parse the JSON.
//         return Post.fromJson(jsonDecode(response.body));
//       } else {
//         // If the server did not return a 200 OK response,
//         // then throw an exception.
//         throw Exception('Failed to load album');
//       }
//     });
//     return Post.fromJson(jsonDecode(response.title));
//   }
//  */
//
// }
