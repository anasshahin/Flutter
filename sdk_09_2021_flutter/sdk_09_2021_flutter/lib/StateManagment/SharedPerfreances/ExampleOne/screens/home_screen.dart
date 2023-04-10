import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Models/user_model.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Service/user_servise.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/router_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              var result = await _userService.logout();
              if(result){
                Navigator.of(context).popAndPushNamed(welcomePageRoute);
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'name : ${widget.userModel.name}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'username : ${widget.userModel.username}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'password : ${widget.userModel.password}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'address : ${widget.userModel.address}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'loginState : ${widget.userModel.loginState}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
