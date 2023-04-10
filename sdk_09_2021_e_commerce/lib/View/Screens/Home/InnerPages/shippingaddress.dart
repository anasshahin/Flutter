// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  String _selection = '';

  List<List<String>> choices = [
    ["Home Address", "Work Address"], // 1st qns has 3 choices
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 160,
        height: 40,
        child: FloatingActionButton.extended(
          backgroundColor: ThemeManager.accent,
          onPressed: () {},
          label: Text(
            'New',
            style: TextStyle(fontSize: 17),
          ),
          shape: RoundedRectangleBorder(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 45)),
                Text(
                  'Shipping address',
                  style: TextStyle(
                      color: ThemeManager.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15)),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: choices[0].map((item) {
                //change index of choices array as you need
                return RadioListTile(
                  subtitle: SizedBox(
                    height: 60,
                  ),
                  groupValue: _selection,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                            color: ThemeManager.textColor,
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      RichText(
                          text: TextSpan(
                              text:
                                  'Mrs Smith 813 Howard Street Oswego  location of a building, '
                                  'apartment, or other structure or a plot of land',
                              // This is default address you need to take it from the user
                              style: TextStyle( color: ThemeManager.textColor,)),

                      )
                    ],
                  ),
                  value: item,
                  activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _selection = "$val";
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
