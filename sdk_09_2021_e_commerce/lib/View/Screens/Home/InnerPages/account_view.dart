import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/user_data_helper.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/Component/account_header_prop.dart';
import 'package:sdk_09_2021_e_commerce/core/Services/user_service.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userRole = {};
    Map<String, dynamic> userData = {};
    userRole = getUserRoles();
    userData = getUserData();
    log('$userRole');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccountHeader(
              name: userData['name'],
              email: userData['email'],
              imageUrl: userData['imageUrl'],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            AccountProrerties(
              title: 'Edit profile',
              image: 'assets/Account/Icon_Edit-Profile.png',
              onTap: () {},
            ),
            AccountProrerties(
              title: 'Shipping address',
              onTap: () {
                Navigator.of(context).pushNamed(shippingAddress);
              },
              image: 'assets/Account/Icon_Location.png',
            ),
            AccountProrerties(
              title: 'Order history',
              onTap: () {
                Navigator.of(context).pushNamed(orderHistory);
              },
              image: 'assets/Account/Icon_History.png',
            ),
            AccountProrerties(
              title: 'Cards',
              onTap: () {},
              image: 'assets/Account/Icon_Payment.png',
            ),
            AccountProrerties(
              title: 'Notification',
              onTap: () {},
              image: 'assets/Account/Icon_Alert.png',
            ),
            userRole['adminState'] == true
                ? AccountProrerties(
                    title: 'Admin Panel',
                    onTap: () {
                      Navigator.of(context).pushNamed(adminPanelRoute);
                    },
                    image: 'assets/Account/Icon_Alert.png',
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
              child: ListTile(
                leading: Image.asset('assets/Account/Icon_Exit.png'),
                title: Text('Logout'),
                onTap: () async {
                  await UserService().logout().whenComplete(() {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
