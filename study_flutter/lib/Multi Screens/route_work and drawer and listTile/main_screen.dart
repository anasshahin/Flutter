import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  void selectScreen(BuildContext ctx){

    Navigator.of(ctx).pushNamed(
        interOne!?'/x/first':'/x/two',
    arguments: {
          'id':12,
      'name':'anas',
    });

  }
  bool ?interOne;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body:  const Center(),
      drawer: Drawer(
        child: ListView(

          children: [
            ListTile( // we replace InkWell and put ListTile
              // it has extra properties than InkWell
              onTap: (){
                interOne=false;
                selectScreen(context);
              },

              title: const Text('go to screen two ', // title equal to child
                style: TextStyle(fontSize: 30,fontFamily: 'Julee Regular'),),
              subtitle: const Text('go to screen two ', // title equal to child
              ),
              trailing: const Icon(Icons.ac_unit_rounded),
            ),
            ListTile(
              onTap: (){ interOne=true;
              selectScreen(context);
              },
              title: const Text('go to screen one ',
                style: TextStyle(fontSize: 30,fontFamily: 'Julee Regular'),),
              subtitle: const Text('go to screen one ', // title equal to child
              ),
              trailing: const Icon(Icons.ac_unit_rounded),

            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(

          children: [
            ListTile( // we replace InkWell and put ListTile
              // it has extra properties than InkWell
              onTap: (){
                interOne=false;
                selectScreen(context);
              },

              title: const Text('go to screen two ', // title equal to child
                style: TextStyle(fontSize: 30,fontFamily: 'Julee Regular'),),
              subtitle: const Text('go to screen two ',
              ),
              trailing: const Icon(Icons.ac_unit_rounded),
            ),
            ListTile(
              onTap: (){ interOne=true;
              selectScreen(context);
              },
              title: const Text('go to screen one ',
                style: TextStyle(fontSize: 30,fontFamily: 'Julee Regular'),),
              subtitle: const Text('go to screen one ', // title equal to child
              ),
              trailing: const Icon(Icons.ac_unit_rounded),

            ),
          ],
        ),
      ),
      drawerScrimColor: Colors.orangeAccent.withOpacity(0.5),
    );
  }
}
