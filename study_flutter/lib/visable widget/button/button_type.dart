import 'package:flutter/material.dart';

class ButtonType extends StatefulWidget {
  const ButtonType({Key? key}) : super(key: key);

  @override
  State<ButtonType> createState() => _ButtonTypeState();
}

class _ButtonTypeState extends State<ButtonType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonType'),
        backgroundColor: const Color(0x91F12FFD),
      ),
      backgroundColor: const Color(0xffBEAEBF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('anas', style: TextStyle(fontSize: 30)),
            ),
            // it show normal text without any design but this text we can click
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'shahin',
                  style: TextStyle(fontSize: 30),
                )),
            // it is a button with simple design of a button
            OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'sa',
                  style: TextStyle(fontSize: 30),
                )),
            // it is a button that is only with border
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc,size: 50),
                label: const Text(
                  'study',style: TextStyle(fontSize: 20),// label is like child in normal TextButton
                )),

            ElevatedButton.icon(
              icon: const Icon(Icons.shop_sharp),
                onPressed: () {},
                label:
                 const Text(
                  'shahin',
                  style: TextStyle(fontSize: 30),
                )),
            OutlinedButton.icon(
              icon: const Icon(Icons.shop_sharp),
                onPressed: () {},
                label: const Text(
                  'sa',
                  style: TextStyle(fontSize: 30),
                )),
            // these three button is like the before button but with icon
            // FloatingActionButton it is a simple widget can put at any place
            FloatingActionButton.extended(onPressed: (){},
              label:const Text('add'),
              icon:const Icon(Icons.add),
              backgroundColor: Colors.black12,
              foregroundColor: Colors.green,
              splashColor: Colors.red,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                side: BorderSide(color: Colors.white,width: 6),

              ),
            )
          ],
        ),
      ),
      // can put FloatingActionButton.extended here
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),// could be any widget
        // can put row or column
        backgroundColor: Colors.black12,
        foregroundColor: Colors.green,
        splashColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          side: BorderSide(color: Colors.white,width: 6),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
