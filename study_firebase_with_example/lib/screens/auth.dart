import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = false;
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = "";
  var _enteredPassword = "";

  void _submit() {
    final valid = _formKey.currentState!.validate();
    if (!valid) return;

    if (isLogin){}
    else{
     try{
      final userCredential=    _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
     }
     on FirebaseAuthException catch(e){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Auth failed")));
       log(e.message!);
     }
    
    }
    _formKey.currentState!.save();

    // this instruction mean that active onSaved (execute instruction that is on it)

    log("$_enteredEmail\n");
    log(_enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 30, right: 20, bottom: 20, left: 20),
              child: Image.asset(
                  "assets/images/chat-app-logo-icon-vector-removebg-preview.png"),
            ),
            Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email address",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            onSaved: (value) => _enteredEmail = value!,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains("@")) {
                                return "please enter a valid email address";
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Password",
                            ),
                            obscureText: true,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            onSaved: (value) => _enteredPassword = value!,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Password must be at least 6 characters long. ";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: Text(isLogin ? "Login" : 'Signup')),
                          const SizedBox(
                            height: 12,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              //style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primaryContainer),
                              child: Text(isLogin
                                  ? "I already have an account"
                                  : 'Create an account')),
                        ],
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
