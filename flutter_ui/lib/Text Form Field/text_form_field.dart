import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

enum AuthMode { signUp, login }

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (authMode == AuthMode.login) {
      setState(() {
        authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (!EmailValidator.validate(val!)) {
                        return "* Not Valid Email";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _authData['email'] = val!;
                      log(_authData['email']!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password",),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val!.isEmpty ||val.length <= 6 ){
                        return "the password is too short";
                      }
                      if (!val.toString().contains(RegExp(r'[A-Z]'))){
                        return "the password must contain Upper Char";
                      }
                      if (!val.toString().contains(RegExp(r'[0-9]'))){
                        return"the password must contain number";
                      }
                      return null;

                    },
                    onSaved: (val) {
                      _authData['password'] = val!;
                      log(_authData['password']!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (authMode==AuthMode.signUp)
                  TextFormField(
                    enabled: authMode==AuthMode.signUp,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: authMode==AuthMode.signUp?(value){
                      if(value!=_passwordController.text){
                        return "Passwords do not match";
                      }
                      return null;
                    }:null,
                  ),
                ElevatedButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.greenAccent),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey)),
                  child:
                      Text(_authData == AuthMode.login ? 'Sign Up' : 'Login'),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: _switchAuthMode,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 4.0),
                    ),
                  ),
                  child: Text(
                      '${_authData == AuthMode.login ? 'Login' : 'Sign Up'} Instead'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (authMode == AuthMode.login) {

    }
  }
}
