import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'package:sdk_09_2021_e_commerce/View/Component/profile_tile.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/payment_success_model.dart';
import 'package:sdk_09_2021_e_commerce/core/bloc/credit_card_bloc.dart';
import 'package:sdk_09_2021_e_commerce/core/session_manager.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key, required this.amount}) : super(key: key);
  final double amount;

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  late BuildContext _context;

  late CreditCardBloc cardBloc;

  MaskedTextController ccMask =
      MaskedTextController(mask: "0000 0000 0000 0000");

  MaskedTextController expMask = MaskedTextController(mask: "00/00");

  final formKey = GlobalKey<FormState>();
  final cardCVV = TextEditingController();
  final cardHolderName = TextEditingController();

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [creditCardWidget(), fillEntries()],
        ),
      );

  Widget creditCardWidget() {
    var deviceSize = MediaQuery.of(_context).size;
    return Container(
      height: deviceSize.height * 0.3,
      color: ThemeManager.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  ThemeManager.accent,
                  ThemeManager.lightPrimary
                ])),
              ),
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.cover,
                ),
              ),
              MediaQuery.of(_context).orientation == Orientation.portrait
                  ? cardEntries()
                  : FittedBox(
                      child: cardEntries(),
                    ),
              const Positioned(
                right: 10.0,
                top: 10.0,
                child: Icon(
                  FontAwesomeIcons.ccVisa,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: StreamBuilder<String>(
                  stream: cardBloc.nameOutputStream,
                  initialData: "Your Name",
                  builder: (context, AsyncSnapshot snapshot) => Text(
                    snapshot.data.length > 0 ? snapshot.data : 'Your Name',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<String>(
                stream: cardBloc.ccOutputStream,
                initialData: "**** **** **** ****",
                builder: (context, AsyncSnapshot snapshot) {
                  snapshot.data.length > 0
                      ? ccMask.updateText(snapshot.data)
                      : null;
                  return Text(
                    snapshot.data.length > 0
                        ? snapshot.data
                        : "**** **** **** ****",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                StreamBuilder<String>(
                    stream: cardBloc.expOutputStream,
                    initialData: "MM/YY",
                    builder: (context, AsyncSnapshot snapshot) {
                      snapshot.data.length > 0
                          ? expMask.updateText(snapshot.data)
                          : null;
                      return ProfileTile(
                        textColor: Colors.white,
                        title: "Expiry",
                        subtitle:
                            snapshot.data.length > 0 ? snapshot.data : "MM/YY",
                      );
                    }),
                SizedBox(
                  width: 30.0,
                ),
                StreamBuilder<String>(
                    stream: cardBloc.cvvOutputStream,
                    initialData: "***",
                    builder: (context, AsyncSnapshot snapshot) => ProfileTile(
                          textColor: Colors.white,
                          title: "CVV",
                          subtitle:
                              snapshot.data.length > 0 ? snapshot.data : "***",
                        )),
              ],
            ),
          ],
        ),
      );

  Widget fillEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: ccMask,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                maxLength: 19,
                style: TextStyle(color: ThemeManager.textColor),
                onChanged: (out) => cardBloc.ccInputSink.add(ccMask.text),
                decoration: InputDecoration(
                  fillColor: ThemeManager.background,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: 'Credit Card Number',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  labelText: "Credit Card Number",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.accent,
                      width: 3.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.textColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: expMask,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: TextStyle(color: ThemeManager.textColor),
                onChanged: (out) => cardBloc.expInputSink.add(expMask.text),
                decoration: InputDecoration(
                  fillColor: ThemeManager.background,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: 'MM/YY',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  labelText: "MM/YY",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.accent,
                      width: 3.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.textColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: cardCVV,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                maxLength: 3,
                style: TextStyle(color: ThemeManager.textColor),
                onChanged: (out) => cardBloc.cvvInputSink.add(out),
                decoration: InputDecoration(
                  fillColor: ThemeManager.background,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: 'CVV',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  labelText: "CVV",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.accent,
                      width: 3.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.textColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: cardHolderName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                maxLength: 20,
                style: TextStyle(color: ThemeManager.textColor),
                onChanged: (out) => cardBloc.nameInputSink.add(out),
                decoration: InputDecoration(
                  fillColor: ThemeManager.background,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: 'Name on card',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  labelText: "Name on card",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.accent,
                      width: 3.0,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager.textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget floatingBar() => Ink(
        decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
                colors: [ThemeManager.accent, ThemeManager.lightPrimary])),
        child: FloatingActionButton.extended(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              var model = PaymentSuccessModel(
                  cardNameHolder: cardHolderName.text,
                  cardNumber: ccMask.text,
                  paymentDate:
                      DateFormat.yMMMMd('en_US').format(DateTime.now()),
                  paymentTime: DateFormat.jm().format(DateTime.now()),
                  amount: widget.amount,
                  cardEmailHolder:
                      Prefs.getStringValue('email') ?? 'user@example.com');
              Navigator.of(context).pushNamed(paymentSuccess, arguments: model);
            }
          },
          backgroundColor: Colors.transparent,
          icon: Icon(
            FontAwesomeIcons.amazonPay,
            color: Colors.white,
          ),
          label: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    cardBloc = CreditCardBloc();
    return Scaffold(
      backgroundColor: ThemeManager.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Payment Here'),
        backgroundColor: ThemeManager.accent,
      ),
      body: bodyData(),
      floatingActionButton: floatingBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
