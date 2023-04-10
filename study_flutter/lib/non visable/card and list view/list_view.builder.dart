import 'package:flutter/material.dart';

import '../map function/person_class.dart';



class CardAndListView extends StatelessWidget {

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

   CardAndListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapFunctionUse')),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (ctx,index){
         return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: Colors.blueGrey,
              shadowColor: Colors.greenAccent,
              elevation: 10,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(persons[index].name,style:  const TextStyle(color: Colors.yellow)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(persons[index].date.toString(),style: const TextStyle(color: Colors.yellow)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(persons[index].gender,style: const TextStyle(color: Colors.yellow)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(persons[index].height.toString(),style: const TextStyle(color: Colors.yellow)),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
