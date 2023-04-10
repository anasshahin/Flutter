import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_screen.dart';
class SharedPreferencesOpenScreen extends StatefulWidget {
  const SharedPreferencesOpenScreen({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesOpenScreen> createState() => _SharedPreferencesOpenScreenState();
}

class _SharedPreferencesOpenScreenState extends State<SharedPreferencesOpenScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black45),
          ),
          child: const Text('go to another screen ',style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          ),
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const DataScreen()));
          } ,
        ),
      ),
    );
  }
}
setData(){
  // SharedPreferences _prefs =await SharedPreferences.getInstance(); we can do this
  Future<SharedPreferences>_pref =   SharedPreferences.getInstance();
  _pref.then((value) {
    value.setString('Name', 'anas');
    value.setString('Skill 1', 'flutter');
    value.setString('Skill 2', 'web');
    value.setInt('Height', 190);
    value.setInt('Age', 22);
    value.setBool('Developer', true);

  });
}