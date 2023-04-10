import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen(
      {Key? key,
      required this.img,
      required this.name,
      required this.loc,
      required this.email})
      : super(key: key);
  final String img;
  final String name;
  final String loc;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                    radius: 70, backgroundImage: NetworkImage(img)),
              ),
              const SizedBox(height: 10),
              Text(name, style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 5),
              Text(email, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              Text(loc, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
