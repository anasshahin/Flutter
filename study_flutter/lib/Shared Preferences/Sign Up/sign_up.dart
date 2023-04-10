import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_screen.dart';
class SignUpSharedPreferences extends StatefulWidget {
  const SignUpSharedPreferences({Key? key}) : super(key: key);

  @override
  State<SignUpSharedPreferences> createState() => _SignUpSharedPreferencesState();
}

class _SignUpSharedPreferencesState extends State<SignUpSharedPreferences> {
 final TextEditingController _email =  TextEditingController();
 final TextEditingController _password= TextEditingController();
 void selectScreen(BuildContext context){
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const AppScreen()));
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(

                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon( Icons.password),
                  hoverColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                    prefixIcon:const Icon( Icons.email),
                    hoverColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
            ),
            ElevatedButton( child:const Text('SignUp'),onPressed: ()async{
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              _prefs.setString('email', _email.text);
              _prefs.setString('password', _password.text);
              selectScreen(context);
            },
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 40))), )
          ],
        ),
      ),
    );
  }
}
