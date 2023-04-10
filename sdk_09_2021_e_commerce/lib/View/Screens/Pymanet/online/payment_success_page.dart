import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/View/Component/profile_tile.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/payment_success_model.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({Key? key, required this.model}) : super(key: key);
  final PaymentSuccessModel model;

  @override
  PaymentSuccessPageState createState() {
    return PaymentSuccessPageState();
  }
}

class PaymentSuccessPageState extends State<PaymentSuccessPage> {
  bool isDataAvailable = true;

  Widget bodyData() => Center(
    child: isDataAvailable
        ? RaisedButton(
      shape: StadiumBorder(),
      onPressed: () => showSuccessDialog(),
      color: Colors.amber,
      child: Text("Process Payment"),
    )
        : CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      appBar: AppBar(
        backgroundColor: ThemeManager.accent,
        title: const Text('Payment Success'),
      ),
      body: bodyData(),
    );
  }

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                successTicket(),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  backgroundColor: ThemeManager.textColor,
                  child: Icon(
                    Icons.clear,
                    color: ThemeManager.textColorNegative,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
  }

  successTicket() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    child: Material(
      color: ThemeManager.background,
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileTile(
              title: "Thank You!",
              textColor: ThemeManager.accent,
              subtitle: "Your transaction was successful",
            ),
            ListTile(
              title: Text("Date"),
              subtitle: Text(
                widget.model.paymentDate,
                style: TextStyle(color: ThemeManager.textColor),
              ),
              trailing: Text(widget.model.paymentTime),
            ),
            ListTile(
              title: Text(widget.model.cardNameHolder),
              subtitle: Text(widget.model.cardEmailHolder,
                  style: TextStyle(color: ThemeManager.textColor)),
              trailing: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/image/userProfile.jpg'),
              ),
            ),
            ListTile(
              title: Text("Amount"),
              subtitle: Text('\$${widget.model.amount}',
                  style: TextStyle(color: ThemeManager.textColor)),
              trailing: Text("Completed"),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              color: ThemeManager.background,
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.ccAmex,
                  color: Colors.blue,
                ),
                title: Text("Credit/Debit Card"),
                subtitle: Text(
                    "Your Card ending **${widget.model.cardNumber.substring(widget.model.cardNumber.length - 2, widget.model.cardNumber.length)}",
                    style: TextStyle(color: ThemeManager.textColor)),
              ),
            )
          ],
        ),
      ),
    ),
  );
}