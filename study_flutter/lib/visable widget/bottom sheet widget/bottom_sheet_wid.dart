import 'package:flutter/material.dart';

import '../../non visable/card and list view/person_class.dart';

class BottomSheetWidget extends StatelessWidget {


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

   BottomSheetWidget({Key? key}) : super(key: key);
  void bottomView(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return ListView.builder(
          itemCount: persons.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: Theme.of(ctx).colorScheme.secondary,
                shadowColor: Colors.greenAccent,
                elevation: 10,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(persons[index].name,style:   TextStyle(color: Theme.of(ctx).primaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(persons[index].date.toString(),style:  TextStyle(color:  Theme.of(ctx).primaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(persons[index].gender,style:  TextStyle(color:  Theme.of(ctx).primaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(persons[index].height.toString(),style:  TextStyle(color:  Theme.of(ctx).primaryColor)),
                    ),
                  ],
                ),
              ),
            );
          }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bottomView(context);
        },child:const Icon(Icons.view_agenda) ),
    );
  }
}
