import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/Service/connectivity_service.dart';
import 'package:sdk_09_2021_flutter_firebase/Core/Service/user_service.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Component/internet_connection_dailog.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Component/loader.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseAuth/Router/router_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String userEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Hero(
                  tag: 'hero',
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.network(
                          'https://raw.githubusercontent.com/ageelbaraa/SDK/main/LOGO/SDK.png'),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _email,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          icon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          )),
                      validator: (value) =>
                          value!.isEmpty ? 'Email can\'t be empty' : null,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _password,
                    maxLines: 1,
                    obscureText: true,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value!.isEmpty ? 'Password can\'t be empty' : null,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                    child: SizedBox(
                      height: 40.0,
                      child: RaisedButton(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.blue,
                        child: Text('Login',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        onPressed: () {
                          validateAndSubmit(context);
                        },
                      ),
                    )),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: RichText(
                      text: TextSpan(
                          text: 'Do not have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(signUp);
                                  })
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.looks_one),
                        label: Text('Sign In With Google'),
                        onPressed: () async {
                          await _userService.signInWithGoogle();
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.facebook),
                        label: Text('Sign In With Facebook'),
                        onPressed: () async {
                          await signInWithFacebook().whenComplete(() {
                            Navigator.of(context).pushNamed(profileWithFacebook,
                                arguments: userEmail);
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${_email.text.trim()} | password : ${_password.text.trim()}');
        var result = await _userService.signIn(
            _email.text.trim(), _password.text.trim());
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
          Navigator.of(context).pushNamed(homeRote, arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile', 'user_birthday']
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
