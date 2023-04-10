import 'package:flutter/material.dart';

import '../../router/constant_router.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          elevation: 10,
          borderRadius:BorderRadius.circular(28) ,
          color: Colors.blue,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(multiLevel);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: const AssetImage(
                    'assets/sbomb.jpg',
                  ),
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 6,),
                const  Text('Play the game',style: TextStyle(
                  fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
