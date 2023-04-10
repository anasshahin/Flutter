import 'package:flutter/material.dart';
class ApplicationOnAnimation extends StatefulWidget {
  const ApplicationOnAnimation({Key? key}) : super(key: key);

  @override
  State<ApplicationOnAnimation> createState() => _ApplicationOnAnimationState();
}
enum AuthMode {signUp, signIn}
class _ApplicationOnAnimationState extends State<ApplicationOnAnimation>
{

   AuthMode _authMode =AuthMode.signIn;
   String textMode= 'SIGN UP  INSTEAD';
   var formKey = GlobalKey<FormState>();
   final email = TextEditingController();
   final password = TextEditingController();
   final passwordConfirm = TextEditingController();
   @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
     
      body: Center(
        child: Card(
          margin:const EdgeInsets.all(12),
          elevation: 8.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(16.0),
            height: _authMode== AuthMode.signUp? 320:260,
            child: Form(child: SingleChildScrollView
              (child: Column(
              children: [
                TextFormField(
             controller: email,
                 decoration: const InputDecoration(
                   labelText: 'Email',
                 border: UnderlineInputBorder( )),
                ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: UnderlineInputBorder( )),
              ),
             // if (_authMode== AuthMode.signUp)
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: _authMode== AuthMode.signUp?120:0,
                    //minHeight: _authMode== AuthMode.signUp?60:0,
                  ),
                  child: AnimatedOpacity(
                    opacity: _authMode== AuthMode.signUp? 1:0,
                    duration: const Duration(milliseconds: 500),
                    child: TextFormField(controller: passwordConfirm,
                    decoration: const InputDecoration(
                        labelText: 'Password confirm',
                        border: UnderlineInputBorder( )),),
                  ),
                ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed:(){}, child: const Text('Sign in')),
              TextButton(onPressed: (){setState(() {
                _authMode= _authMode==AuthMode.signUp?AuthMode.signIn:AuthMode.signUp;
                textMode = textMode == 'SIGN UP  INSTEAD'? 'LOGIN INSTEAD':'SIGN UP  INSTEAD';
              });


              }, child: Text(textMode))
            ],))),
          ),
        ),
      ),
    );
  }
}
