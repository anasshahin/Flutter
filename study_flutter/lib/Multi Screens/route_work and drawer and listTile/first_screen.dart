import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {


  const FirstScreen( {Key? key}) : super(key: key);

  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).pushReplacementNamed('/x/two',
        arguments: {
          'id':15,
          'name':'alaa shahin',
        });
  }
  @override
  Widget build(BuildContext context) {
    final routeArgument= ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('first Screen'),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("${routeArgument['id']}", style: const TextStyle(fontSize: 35,fontFamily: 'Julee Regular',color: Colors.redAccent),),
             Text('${routeArgument['name']}', style: const TextStyle(fontSize: 35,fontFamily: 'Julee Regular',color: Colors.redAccent),),
            InkWell(
              onTap: ()=>selectScreen(context),
              child: const Text('go to screen two ',
                style: TextStyle(fontSize: 35,fontFamily: 'Julee Regular'),),
            ),
          ],
        ),
      ),
    );
  }
}
