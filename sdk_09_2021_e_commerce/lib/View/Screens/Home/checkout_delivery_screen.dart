import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';

class CheckoutDeliveryScreen extends StatefulWidget {
  const CheckoutDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutDeliveryScreen> createState() => _CheckoutDeliveryScreenState();
}

class _CheckoutDeliveryScreenState extends State<CheckoutDeliveryScreen> {
  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.lightPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    color: ThemeManager.lightPrimary,
                    width: 90.0,
                  ),
                  Text(
                    'Checkout',
                    style: TextStyle(
                      color: ThemeManager.textColor,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 23.0,
                        backgroundColor: ThemeManager.lightAccent,
                        child: SizedBox(
                          child: CircleAvatar(
                            backgroundColor: ThemeManager.lightPrimary,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircleAvatar(
                                backgroundColor: ThemeManager.lightAccent,
                                child: Icon(Icons.check,
                                    color: ThemeManager.lightPrimary),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey[500],
                        height: 3.0,
                        width: 110.0,
                      ),
                      CircleAvatar(
                        maxRadius: 23.0,
                        backgroundColor: Colors.grey[500],
                        child: SizedBox(
                          child: CircleAvatar(
                            backgroundColor: ThemeManager.lightPrimary,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey[500],
                        height: 3.0,
                        width: 110.0,
                      ),
                      CircleAvatar(
                        maxRadius: 23.0,
                        backgroundColor: Colors.grey[500],
                        child: SizedBox(
                          child: CircleAvatar(
                            backgroundColor: ThemeManager.lightPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                      color: ThemeManager.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Summer',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Standard Delivery',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Divider(color: ThemeManager.lightPrimary, height: 10.0),
                        Text(
                          'Order will be delivered between 3 - 5 business days',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ThemeManager.lightPrimary, indent: 60.0),
                  Radio(
                    activeColor: ThemeManager.lightAccent,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as int;
                      });
                    },
                    groupValue: groupValue,
                    value: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Day Delivery',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Divider(color: ThemeManager.lightPrimary, height: 10.0),
                        Text(
                          'Place your order before 6pm and your items will be delivered the next day',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ThemeManager.lightPrimary, indent: 60.0),
                  Radio(
                    activeColor: ThemeManager.lightAccent,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as int;
                      });
                    },
                    groupValue: groupValue,
                    value: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nominated Delivery',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Divider(color: ThemeManager.lightPrimary, height: 10.0),
                        Text(
                          'Pick a particular date from the calendar and order will be delivered on selected date',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ThemeManager.lightPrimary, indent: 60.0),
                  Radio(
                    activeColor: ThemeManager.lightAccent,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as int;
                      });
                    },
                    groupValue: groupValue,
                    value: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(addressCheckoutRoute);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ThemeManager.lightAccent),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          width: 2,
                          color: ThemeManager.lightAccent,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 55),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 30),
                      ),
                    ),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: ThemeManager.lightPrimary,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
