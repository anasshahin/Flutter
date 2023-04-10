import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';


class ForgotPasswordScreen extends StatefulWidget {
   const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _scaffoldKey =  GlobalKey<ScaffoldState>();
   TextEditingController email=TextEditingController();
   TextEditingController digits=TextEditingController();
   TextEditingController password=TextEditingController();
   TextEditingController newPassword=TextEditingController();
   int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
       child: InkWell(
         onTap: (){
      showModalBottomSheet<void>(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),),

         context: context,
         builder: (context){
        return SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 25, color: Colors.black,
                        fontWeight:FontWeight.bold ),
                  ),
                ),
                const  Padding(
                  padding:  EdgeInsets.all(15.0),
                  child:  Text('Enter your email for the verification process\nWe will send 4 digits to your email.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
            hintStyle: TextStyle(color: ThemeManager.textColor),
            labelStyle: TextStyle(color: ThemeManager.accent),
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeManager.textColor)),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeManager.accent)),
            errorBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      hintText: 'inter your email',
                      labelText: 'email',
            ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet<void>(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),),
                        context: context,
                        builder: (context){
                        return SizedBox(
                          height: 300,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:  [
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Enter 4 Digits Code',
                                  style: TextStyle(fontSize: 25, color: Colors.black,
                                      fontWeight:FontWeight.bold ),
                                ),
                              ),
                              const  Padding(
                                padding:  EdgeInsets.all(15.0),
                                child:  Text('Enter the 4 digits code that you received on\n your email'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  controller: digits,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: ThemeManager.textColor),
                                    labelStyle: TextStyle(color: ThemeManager.accent),
                                    border: const UnderlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: ThemeManager.textColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: ThemeManager.accent)),
                                    errorBorder:
                                    const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                    hintText: 'inter 4 digits',
                                    labelText: 'digits number code',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(

                                  onPressed: () {
                                    Navigator.pop(context);
                                    showModalBottomSheet<void>(
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),),
                                      context: context,
                                      builder: (context){
                                        return SizedBox(
                                          height: 500,
                                          child:  Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children:  [
                                              const Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Text(
                                                  'Reset Password',
                                                  style: TextStyle(fontSize: 25, color: Colors.black,
                                                      fontWeight:FontWeight.bold ),
                                                ),
                                              ),
                                              const  Padding(
                                                padding:  EdgeInsets.all(15.0),
                                                child:  Text('set the new password for your account so\nyou can login and access all the features'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: TextFormField(
                                                  controller: password,
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(color: ThemeManager.textColor),
                                                    labelStyle: TextStyle(color: ThemeManager.accent),
                                                    border: const UnderlineInputBorder(),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: ThemeManager.textColor)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: ThemeManager.accent)),
                                                    errorBorder:
                                                    const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                                    hintText: 'inter new password',
                                                    labelText: 'new password',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: TextFormField(
                                                  controller: newPassword,
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(color: ThemeManager.textColor),
                                                    labelStyle: TextStyle(color: ThemeManager.accent),
                                                    border: const UnderlineInputBorder(),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: ThemeManager.textColor)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: ThemeManager.accent)),
                                                    errorBorder:
                                                    const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                                    hintText: 'rewrite your new password',
                                                    labelText: 'new password',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: ElevatedButton(

                                                  onPressed: () {

                                                  },
                                                  child: const Text('Reset Password'),
                                                  style:ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(ThemeManager.accent),
                                                      shape: MaterialStateProperty.all( const StadiumBorder())
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ) ,
                                        );
                                      },
                                    );

                                  },
                                  child: const Text('Continue'),
                                  style:ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(ThemeManager.accent),
                                      shape: MaterialStateProperty.all( const StadiumBorder())
                                  ),
                                ),
                              ),
                            ],
                          ) ,
                        );
                        },
                      );

                },
                    child: const Text('Continue'),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ThemeManager.accent),
                    shape: MaterialStateProperty.all( const StadiumBorder())
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      });

    },
         child: const Text(
           'Sign'
         ),
       ),

      ),

    );
  }
}
