// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'OrderNumber',
                    style: TextStyle(
                        color: ThemeManager.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/Map_View.png',
                      width: 90,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '20/18\n',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: '10:00 Am',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 32)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '20/18\n',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: '10:00 Am',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 32)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '20/18\n',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: '10:00 Am',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 32)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '20/18\n',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: '10:00 Am',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 32)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '20/18\n',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: '10:00 Am',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TimelineTile(
                            beforeLineStyle: LineStyle(color: Colors.white),
                            afterLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            indicatorStyle: IndicatorStyle(
                                color: ThemeManager.accent,
                                width: 30,
                                height: 30,
                                indicator: Stack(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ThemeManager.accent),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      bottom: 7,
                                      right: 7,
                                      left: 7,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: ThemeManager.accent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TimelineTile(
                            beforeLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            afterLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            indicatorStyle: IndicatorStyle(
                                color: ThemeManager.accent,
                                width: 30,
                                height: 30,
                                indicator: Stack(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ThemeManager.accent),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      bottom: 7,
                                      right: 7,
                                      left: 7,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: ThemeManager.accent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TimelineTile(
                            beforeLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            afterLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            indicatorStyle: IndicatorStyle(
                                color: ThemeManager.accent,
                                width: 30,
                                height: 30,
                                indicator: Stack(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ThemeManager.accent),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      bottom: 7,
                                      right: 7,
                                      left: 7,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: ThemeManager.accent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TimelineTile(
                            beforeLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            afterLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            indicatorStyle: IndicatorStyle(
                                color: ThemeManager.accent,
                                width: 30,
                                height: 30,
                                indicator: Stack(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ThemeManager.accent),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      bottom: 7,
                                      right: 7,
                                      left: 7,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: ThemeManager.accent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TimelineTile(
                            beforeLineStyle:
                                LineStyle(color: ThemeManager.accent),
                            afterLineStyle: LineStyle(color: Colors.white),
                            indicatorStyle: IndicatorStyle(
                                color: ThemeManager.accent,
                                width: 30,
                                height: 30,
                                indicator: Stack(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ThemeManager.accent),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      bottom: 7,
                                      right: 7,
                                      left: 7,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Order Signed\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                            text: 'lagos state',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Order Processed\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                            text: 'lagos state',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Shipped\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                            text: 'lagos state',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Out for delivery\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                            text: 'lagos state',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Delivered\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                            text: 'lagos state',
                            style: TextStyle(color: Colors.grey[700]))
                      ])),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
