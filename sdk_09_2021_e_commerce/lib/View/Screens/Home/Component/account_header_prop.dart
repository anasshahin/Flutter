import 'package:flutter/material.dart';

import '../../../../Utils/theme_manager.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader(
      {Key? key,
      required this.name,
      required this.email,
      required this.imageUrl})
      : super(key: key);
  final String name;
  final String email;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 25)),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 60,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: ThemeManager.textColor, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(email),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AccountProrerties extends StatelessWidget {
  const AccountProrerties(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);
  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(image),
        title: Text(title),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
        ),
      ),
    );
  }
}
