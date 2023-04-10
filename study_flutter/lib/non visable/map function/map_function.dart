import 'package:flutter/material.dart';

import '../card and list view/person_class.dart';

class BadUse extends StatelessWidget {
  BadUse({Key? key}) : super(key: key);
 final Person person1 = Person(
      gender: 'M', date: DateTime.now().year - 22, height: 190, name: 'anas');
  final Person person2 = Person(
      gender: 'M', date: DateTime.now().year - 21, height: 180, name: 'zaid');
  final Person person3 = Person(
      gender: 'M', date: DateTime.now().year - 20, height: 185, name: 'khaled');
  final Person person4 = Person(
      gender: 'M', date: DateTime.now().year - 18, height: 170, name: 'morad');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person1.name,style: const TextStyle(color: Colors.red)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person1.date.toString(),style: const TextStyle(color: Colors.red)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person1.gender,style: const TextStyle(color: Colors.red)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person1.height.toString(),style: const TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person2.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person2.date.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person2.gender),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person2.height.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person3.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person3.date.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person3.gender),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person3.height.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person4.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person4.date.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person4.gender),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(person4.height.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapFunctionUse extends StatelessWidget {
  MapFunctionUse({Key? key}) : super(key: key);

 final List<Person> persons = [
    Person(
        gender: 'M', date: DateTime.now().year - 22, height: 190, name: 'anas'),
    Person(
        gender: 'M', date: DateTime.now().year - 21, height: 180, name: 'zaid'),
    Person(
        gender: 'M',
        date: DateTime.now().year - 20,
        height: 185,
        name: 'khaled'),
    Person(
        gender: 'M',
        date: DateTime.now().year - 18,
        height: 170,
        name: 'morad'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapFunctionUse')),
      body: Column(
        children: persons.map((val){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(val.name,style:  const TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(val.date.toString(),style: const TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(val.gender,style: const TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(val.height.toString(),style: const TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
