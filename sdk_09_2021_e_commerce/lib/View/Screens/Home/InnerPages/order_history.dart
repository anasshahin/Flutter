// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../Utils/router/route_constant.dart';
import '../../../../Utils/theme_manager.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
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
                    'Track Order',
                    style: TextStyle(
                        color: ThemeManager.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              OrderView(
                imagePath:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYFO8ENI5zf9oEeb0x9RcNwgkqftdv2LFoFA&usqp=CAU',
                price: '1540',
                date: 'sep 23,2018',
                productNum: 'OD-42493319-N',
                onTap: () {
                  Navigator.of(context).pushNamed(orderDetails);
                },
              ),
              OrderView(
                imagePath:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvG2xA8-Q0sj-s7u2Dpds03f241ccdiPMmlA&usqp=CAU',
                price: '200',
                date: 'Oct 10,2022',
                productNum: 'OD-42493319-N',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView(
      {Key? key,
      required this.date,
      required this.productNum,
      required this.price,
      required this.imagePath,
      required this.onTap})
      : super(key: key);
  final String date;
  final String productNum;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productNum,
                        style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$$price",
                        style: TextStyle(color: ThemeManager.accent),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Delivered',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: ThemeManager.accent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(imagePath),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
