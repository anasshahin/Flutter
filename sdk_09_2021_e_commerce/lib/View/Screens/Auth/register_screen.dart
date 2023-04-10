import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/user_service.dart';

import '../../../Utils/internet_connection_dailog.dart';
import '../../../Utils/loader.dart';
import '../../../Utils/router/route_constant.dart';
import '../../../core/Services/connectivity_service.dart';
import '../../Component/my_text_field_component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  bool colorManageName = false;
  bool colorManageEmail = false;
  bool colorManagePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      alignment: Alignment.centerLeft),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: ThemeManager.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFieldComponent(
                              labelText: 'Name',
                              hintText: 'Enter your name',
                              controller: name,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFieldComponent(
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                            controller: email,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFieldComponent(
                              labelText: 'Password',
                              hintText: '****************',
                              controller: password,
                              obscureText: true,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                await validateAndSubmit(context)
                                    .whenComplete(() {
                                  log('sign up completed');
                                });
                              },
                              child: const Text('SIGN UP'),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 15)),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff00C569)))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');
        var userValues = HashMap();
        userValues['email'] = email.text.trim();
        userValues['name'] = name.text.trim();
        userValues['password'] = password.text.trim();
        var result = await _userService.signUp(userValues);
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'The password provided is too weak.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The password provided is too weak.'),
          ));
        } else if (result == 'The account already exists for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context).pushNamed(homeRoute, arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }
}
