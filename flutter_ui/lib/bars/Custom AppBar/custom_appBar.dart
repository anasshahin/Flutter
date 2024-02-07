import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            expandedHeight: 100, // not in the normal AppBar
            title:const Text('CustomAppBar',
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.blue,
                      Colors.black
                    ]
                ),
              ),
            ),
            leading: Padding(
              padding:const EdgeInsets.only(left: 1),
              child: Row(
                children: [
                  IconButton(onPressed: (){},
                      icon:const Icon(Icons.person)),
                  Expanded(
                    child: IconButton(onPressed: (){},
                        icon:const Icon(Icons.person)),
                  )
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: (){},
                  icon:const Icon(Icons.person)),
              IconButton(onPressed: (){},
                  icon:const Icon(Icons.person))
            ],
          ),
          // they give me all proprieties of AppBar and extra proprieties
          SliverList(
            delegate:SliverChildListDelegate([
              // body element
              const Center(child: Text('anas'),),
              const Center(child: Text('anas'),),

            ]),
          )
        ],
    ));
  }
}
