import 'dart:developer';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ThirdScreen/third_screen.dart';

class UserList extends StatelessWidget {
  final String apiUrl = "https://randomuser.me/api/?results=10";

  const UserList({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] + " " + user['name']['first'] + " " + user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country']+" | "+user['location']['city'];
  }
  String _email(dynamic user) {
    return user['email'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            log(_age(snapshot.data[0]));
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdScreen(
                                        img: snapshot.data[index]['picture']['large'],
                                        name: _name(snapshot.data[index]),
                                        loc:_location(snapshot.data[index]),
                                        email:_email(snapshot.data[index]),

                                    )
                                )
                            );
                          },
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  snapshot.data[index]['picture']['large'])),
                          title: Text(_name(snapshot.data[index])),
                          subtitle: Text(_location(snapshot.data[index])),
                          trailing: Text(_age(snapshot.data[index])),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
