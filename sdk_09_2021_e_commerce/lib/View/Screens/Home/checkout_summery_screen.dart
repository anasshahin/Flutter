import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdk_09_2021_e_commerce/Utils/loader.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/address_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cart_item.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/cash_payment_tracking_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/order_item.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/cash_payment_tracking_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/orders_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/Provider/prodect_provider.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';
import 'package:uuid/uuid.dart';

class CheckoutSummeryScreen extends StatefulWidget {
  const CheckoutSummeryScreen({Key? key, required this.model})
      : super(key: key);
  final AddressModel model;

  @override
  State<CheckoutSummeryScreen> createState() => _CheckoutSummeryScreenState();
}

class _CheckoutSummeryScreenState extends State<CheckoutSummeryScreen> {
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    var order = Provider.of<OrdersProvider>(context);
    return Scaffold(
      backgroundColor: ThemeManager.lightPrimary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60.0,
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
                    'Summary',
                    style: TextStyle(
                      color: ThemeManager.textColor,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List<OrderItem> allOrders = order.orders;
                    return CartItemSummeryView(
                      item: allOrders[0].products[index],
                    );
                  },
                  itemCount: order.orders[0].products.length,
                ),
              ),
            ),
            const Divider(color: Colors.black45),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Address',
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Divider(color: ThemeManager.lightPrimary, height: 10.0),
                        Text(
                          widget.model.toString(),
                          style: TextStyle(
                            color: ThemeManager.textColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Divider(color: ThemeManager.lightPrimary, height: 5.0),
                        TextButton(
                          child: Text(
                            'Change',
                            style: TextStyle(
                              color: ThemeManager.lightAccent,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ThemeManager.lightPrimary, indent: 60.0),
                  CircleAvatar(
                    backgroundColor: ThemeManager.lightAccent,
                    radius: 15.0,
                    child: Icon(
                      Icons.check,
                      color: ThemeManager.lightPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black45),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
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
                    foregroundColor:
                        MaterialStateProperty.all(ThemeManager.lightPrimary),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30),
                    ),
                  ),
                  child: Text(
                    'BACK',
                    style: TextStyle(
                      color: ThemeManager.textColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var result = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            backgroundColor: ThemeManager.background,
                            title: Text(
                              'Select your payment method !!',
                              style: TextStyle(color: ThemeManager.textColor),
                            ),
                            children: [
                              SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text(
                                    'Online',
                                    style: TextStyle(
                                        color: ThemeManager.accent,
                                        fontSize: 18),
                                  )),
                              SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        color: ThemeManager.accent,
                                        fontSize: 18),
                                  )),
                            ],
                          );
                        });
                    if (result != null) {
                      Loader.showLoadingScreen(context, _keyLoader);
                      if (result) {
                        Navigator.of(_keyLoader.currentContext ?? context,
                                rootNavigator: true)
                            .pop();
                        Navigator.of(context).pushNamed(onlinePayment,
                            arguments: order.orders[0].amount);
                      } else {
                        var currentUserId = Prefs.getStringValue('uid') ?? '';
                        var productsProvider = Provider.of<ProductProvider>(
                            context,
                            listen: false);
                        var cashPaymentTrackProvider =
                            Provider.of<CashPaymentTrackingProvider>(context,
                                listen: false);
                        log('productIds.length : ${order.orders[0].products.length}');

                        for (var id in order.orders[0].products) {
                          log('product Id : $id');
                          var trackId = Uuid().v4();
                          var trackModel = CashPaymentTrackingModel(
                              id: trackId,
                              productId: id.productId,
                              amount: id.price,
                              buyerId: currentUserId,
                              isDelivered: false,
                              productOwnerId: '0',
                              paymentDate: DateTime.now().toString());
                          await cashPaymentTrackProvider
                              .addCashPaymentTracking(trackModel);
                        }

                        Navigator.of(_keyLoader.currentContext ?? context,
                                rootNavigator: true)
                            .pop();
                        Navigator.of(context)
                            .pushNamed(cashPayment, arguments: order.orders[0]);
                      }
                    }
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
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemSummeryView extends StatelessWidget {
  const CartItemSummeryView({Key? key, required this.item}) : super(key: key);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  item.imageUrl,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style:
                        TextStyle(fontSize: 14, color: ThemeManager.textColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${item.price.toString()}',
                    style: TextStyle(color: ThemeManager.accent),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
