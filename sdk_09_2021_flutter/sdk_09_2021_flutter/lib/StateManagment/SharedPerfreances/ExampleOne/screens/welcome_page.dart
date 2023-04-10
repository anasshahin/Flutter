import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Service/session_manager.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/Service/user_servise.dart';
import 'package:sdk_09_2021_flutter/StateManagment/SharedPerfreances/ExampleOne/router_constant.dart';
import 'package:uuid/uuid.dart';
import '../lib_organizer.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  UserService _userService = UserService();
  bool whichStart = false;

  bool checkIfAlreadySignedIn() {
    if (_userService.checkLoginState()) {
      return true;
    }
    return false;
  }

  void goToHome() {
    Future.delayed(Duration(seconds: 3), () {
      var uid = SharedPrefHelper.getStringValue('id') ?? '';
      if (uid.isNotEmpty) {
        final userData = _userService.getUserBuId(uid);
        Navigator.of(context).popAndPushNamed(HomePageRoute, arguments: userData);
      }else{
       setState(() {
         whichStart = false;
       });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    whichStart = checkIfAlreadySignedIn();
    if (whichStart) {
      goToHome();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: whichStart
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/team_illustration.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enterprise team\ncollaboration.",
                            style: kHeadline,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Bring together your files, your tools, project and people.Including a new mobile and desktop application.",
                              style: kBodyText,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextButton(
                              bgColor: Colors.white,
                              buttonName: 'Register',
                              onTap: () {
                                Navigator.of(context).pushNamed(sigUpPageRoute);
                              },
                              textColor: Colors.black87,
                            ),
                          ),
                          Expanded(
                            child: MyTextButton(
                              bgColor: Colors.transparent,
                              buttonName: 'Sign In',
                              onTap: () {
                                Navigator.of(context).pushNamed(sigInPageRoute);
                              },
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: MyTextButton(
                          buttonName: 'Go to Home',
                          onTap: () async {
                            await SharedPrefHelper.setStringValue(
                                'someId', Uuid().v4());
                            Navigator.of(context).pushNamed(HomePageRoute);
                          },
                          bgColor: Colors.white,
                          textColor: Colors.black87,
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
