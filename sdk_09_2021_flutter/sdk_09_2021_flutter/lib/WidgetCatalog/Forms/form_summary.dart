import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool haveCapitalCharacter = false;
  bool haveSmallCharacter = false;
  bool haveDigit = false;
  bool haveSpecialCharacter = false;
  bool isLengthEnagth = false;
  bool summaryPasswordValidation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
      ),
      body: SingleChildScrollView(
        child: Form(
          //autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 70,
              ),
              Center(
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "* Required";
                    }
                    // if(!validateEmail(value)){
                    //   return "* Not Valid Email";
                    // }
                    if (!EmailValidator.validate(value)) {
                      return "* Not Valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                  onChanged: (value) {
                    setState(() {
                      summaryPasswordValidation = true;
                    });
                    validatePasswords(value);
                  },
                  validator: (value) {
                    if (validatePassword(value!) != null) {
                      return validatePassword(value);
                    }
                    return null;
                  },
                ),
              ),
              summaryPasswordValidation
                  ? Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        haveCapitalCharacter
                            ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Minimum 1 Upper case',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        haveSmallCharacter
                            ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Minimum 1 lowercase',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        haveDigit
                            ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Minimum 1 Numeric Number',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        haveSpecialCharacter
                            ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Minimum 1 Special Character',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLengthEnagth
                            ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Minimum Length 6 Character',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
                  : Container(),
              Center(
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: FlatButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not Have Account?',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    Text(
                      'SignUp',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateEmail(value) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  String? validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regex = new RegExp(pattern.toString());
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'length should be at least 6';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  void validatePasswords(String value) {
    // r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //     .{6,}             // Must be at least 8 characters in length
    // $

    var capitalRegex = r'(.*[A-Z].*)';
    var smallRegex = r'(.*[a-z].*)';
    var digitRegex = r'(.*\d.*)';
    var specialCharRegex = r'(?=.*?[!@#\$&*~])';
    var lengthRegex = r'.{6,}$';

    RegExp regex1 = new RegExp(capitalRegex);
    if (regex1.hasMatch(value)) {
      setState(() {
        haveCapitalCharacter = true;
      });
    }else{
      setState(() {
        haveCapitalCharacter = false;
      });
    }

    RegExp regex2 = new RegExp(smallRegex);
    if (regex2.hasMatch(value)) {
      setState(() {
        haveSmallCharacter = true;
      });
    }
    else{
      setState(() {
        haveSmallCharacter = false;
      });
    }

    RegExp regex3 = new RegExp(digitRegex);
    if (regex3.hasMatch(value)) {
      setState(() {
        haveDigit = true;
      });
    }
    else{
      setState(() {
        haveDigit = false;
      });
    }

    RegExp regex4 = new RegExp(specialCharRegex);
    if (regex4.hasMatch(value)) {
      setState(() {
        haveSpecialCharacter = true;
      });
    }
    else{
      setState(() {
        haveSpecialCharacter = false;
      });
    }

    RegExp regex5 = new RegExp(lengthRegex);
    if (regex5.hasMatch(value)) {
      setState(() {
        isLengthEnagth = true;
      });
    }
    else{
      setState(() {
        isLengthEnagth = false;
      });
    }



  }
}
