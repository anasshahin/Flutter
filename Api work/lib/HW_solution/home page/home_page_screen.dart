import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/random_color.dart';

class HomePageScreen extends StatefulWidget {
   const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final String apiUrl = "https://randomuser.me/api/?results=10";

  final _scaffoldKey =  GlobalKey<ScaffoldState>();



  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  String _location(dynamic user) {
    return user['location']['country']+" | "+user['location']['city'];
  }

  String _name(dynamic user) {
    return user['name']['title'] + " " + user['name']['first'] + " " + user['name']['last'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }
  String _email(dynamic user) {
    return user['email'];
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: fetchUsers(),
      builder:(BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(

            key: _scaffoldKey,
            body: GridView.custom(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              childrenDelegate: SliverChildBuilderDelegate((ctx, index) {
                return InkWell(
                  onTap: () {_scaffoldKey.currentState!
                      .showBottomSheet((context) {
                    return Container(
                      height: 500.0,
                      color: Colors.lightBlueAccent,
                      child:  Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage( snapshot.data[index]['picture']['large'],),

                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(_name(snapshot.data[index]), style: const TextStyle(fontSize: 25)),
                              const SizedBox(height: 5),
                              Text(_email(snapshot.data[index]), style: const TextStyle(fontSize: 15)),
                              const SizedBox(height: 5),
                              Text(_location(snapshot.data[index]), style: const TextStyle(fontSize: 15)),
                            ],
                          )
                      ),
                    );
                  });},
                  child: peopleView(

                      image: snapshot.data[index]['picture']['large'],
                      subtitle: _location(snapshot.data[index]),
                      title: _name(snapshot.data[index]),
                      trailing: _age(snapshot.data[index])
                  ),
                );
              },
                childCount: snapshot.data.length,
              ),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
            ),
          );
        }else  {
          return const Center(child: CircularProgressIndicator());
        }
        },
    );
  }

  Widget peopleView ({

    required String image,
    required String title,
    required String subtitle,
    required String trailing,}){

    return Card(
      color:   Colors.lightBlueAccent,
      child: Column(
        children: [
          Expanded(
           flex: 3,
            child: Image(image: NetworkImage(
              image
            )),
          ),
          Expanded(
            flex: 1,
            child: Text.rich(TextSpan(
            text: title +'\n',
            children: [
                TextSpan(
                text: subtitle + "  " +trailing +'\n'
              ),
              ]
            )),
          ),
        ],
      ),
    );
  }

   
}
