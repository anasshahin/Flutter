import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/user_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/user_provider.dart';

import 'user_item_view.dart';

class UsersMainScreen extends StatefulWidget {
  const UsersMainScreen({Key? key}) : super(key: key);

  @override
  State<UsersMainScreen> createState() => _UsersMainScreenState();
}

class _UsersMainScreenState extends State<UsersMainScreen> {
  UserList? userList;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black87,
              size: 30,
            )),
        centerTitle: true,
        backgroundColor: ThemeManager.accent,
        title: Text(
          'Users',
          style: TextStyle(
            color: ThemeManager.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: userProvider.users,
        builder: (context,snapshot){
          var data = snapshot.data;
          if(data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          userList = data as UserList;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: userList!.users.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Slidable(
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    extentRatio: 0.22,
                    children: [
                      SlidableAction(
                          icon: Icons.restore_from_trash_outlined,
                          backgroundColor: ThemeManager.badgeColor,
                          onPressed: (context) {
                            //Deleting User Account
                          }),
                    ],
                  ),
                  child: UserItemView(userModel: userList!.users[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
