import 'package:flutter/material.dart';

class FormFieldsOne extends StatefulWidget {
  @override
  _FormFieldsOneState createState() => _FormFieldsOneState();
}

class _FormFieldsOneState extends State<FormFieldsOne> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterLogo(
                    size: 150,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* required';
                      }else if(!emailValidator(value)){
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* required';
                      } else if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      } else if (value.length > 15) {
                        return "Password should not be greater than 15 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(
                              'Login Succeeded with : ${email.text} and ${password.text}');
                        } else {
                          print('Wrong or Empty Input');
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool emailValidator(String str) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(str);
  }
}
