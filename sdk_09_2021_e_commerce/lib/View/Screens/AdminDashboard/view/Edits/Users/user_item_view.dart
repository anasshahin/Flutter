import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/user_model.dart';

class UserItemView extends StatelessWidget {
  const UserItemView({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,),
          child: CircleAvatar(
            maxRadius: 30.0,
            child: Image(
                image: NetworkImage(
                  userModel.imageUrl!,
                ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name!,
                style:
                TextStyle(fontSize: 14, color: ThemeManager.textColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                userModel.email!,
                style: TextStyle(color: ThemeManager.accent),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10,),
          child: IconButton(
              onPressed: () {
                //Changing The Role (Basic, Moderator, Admin)
              },
              icon: Icon(Icons.menu,color: ThemeManager.textColor,)),
        )
      ],
    );
  }
}