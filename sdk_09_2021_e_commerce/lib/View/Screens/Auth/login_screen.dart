import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';

import '../../../Utils/internet_connection_dailog.dart';
import '../../../Utils/loader.dart';
import '../../../core/Services/connectivity_service.dart';
import '../../../core/Services/user_service.dart';
import '../../Component/button_component.dart';
import '../../Component/my_text_field_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();
  var email = TextEditingController();
  var password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeManager.textColor),
                              ),
                              TextButton(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: ThemeManager.accent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(signUpRoute);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Sign in to Continue',
                              textAlign: TextAlign.start,
                            ),
                          ),
                          TextFieldComponent(
                            controller: email,
                            hintText: 'example@email.com',
                            labelText: 'Email',
                          ),
                          TextFieldComponent(
                            controller: password,
                            obscureText: true,
                            hintText: '**************',
                            labelText: 'Password',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                                text: 'Forget Password?',
                                style: TextStyle(
                                    color: ThemeManager.textColor,
                                    fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(forgetPasswordRoute);
                                  }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonComponent(
                            buttonText: 'Log in',
                            onPress: () {
                              validateAndSubmit(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    '- OR -',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeManager.textColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  await _userService.signInWithGoogle(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.FacebookNew,
                text: "Sign up with Facebook",
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');
        var result =
            await _userService.signIn(email.text.trim(), password.text.trim());
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'No user found for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No user found for this email.'),
          ));
        } else if (result == 'Wrong password provided for that user.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password provided for this user.'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context).popAndPushNamed(homeRoute, arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }
}
