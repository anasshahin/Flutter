import 'package:flutter/material.dart';

class MyFloatingButton extends StatefulWidget {
  @override
  _MyFloatingButtonState createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  var isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Button'),
      ),
      body: Center(
        child: isActive ? profile() : Container(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            isActive = !isActive;
          });
        },
        icon: Icon(Icons.account_circle),
        label: Text("Profile"),
      ),
    );
  }

  profile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserAccountsDrawerHeader(
            accountEmail: Text('user@sdk.com'),
            accountName: Text('User'),
            currentAccountPicture: CircleAvatar(
              child: Image.network(
                  'https://img.icons8.com/fluency/96/000000/turkey-.png'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                  child: Image.network(
                      'https://img.icons8.com/fluency/96/000000/turkey-.png')),
            ],
          ),
        )
      ],
    );
  }
}
