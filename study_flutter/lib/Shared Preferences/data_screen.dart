import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String name = '';
  int age = 0;
  int height = 0;
  bool developer = false;
  List<String> skills = ['', ''];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    deleteData();
    print('the data is deleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataScreen'),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
            fontWeight: FontWeight.w300, fontSize: 30, color: Colors.black),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name : ' + name),
              Text('Height : ' + height.toString()),
              Text('Age : ' + age.toString()),
              Text('Developer : ' + developer.toString()),
              Text('Skill 1 : ' + skills[0]),
              Text('Skill 2 : ' + skills[1]),
              ElevatedButton(onPressed: () {
                getData();
              }, child: const Text('get data')),
              ElevatedButton(onPressed: () {
                deleteData();
              }, child: const Text('remove data')),

            ],
          ),
        ),
      ),
    );
  }
  getData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _prefs.getString('Name')??'';
      skills[0] = _prefs.getString('Skill 1')?? '';
      skills[1] = _prefs.getString('Skill 2')?? '';
      developer = _prefs.getBool('Developer')?? false;
      age = _prefs.getInt('Age')?? 0;
      height = _prefs.getInt('Height')?? 0;
    });
  }
  deleteData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
       _prefs.remove('Name');
       _prefs.remove('Skill 1');
       _prefs.remove('Skill 2');
       _prefs.remove('Developer');
       _prefs.remove('Age');
       _prefs.remove('Height');
  }

}
