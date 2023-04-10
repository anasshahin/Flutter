import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text(
            'AlertDialog',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            alertEX(context);
          },
        ),
      ),
    );
  }

  void alertEX(BuildContext context) {
    final alertDia = AlertDialog(
      title: const Text('Flutter'),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Divider(color: Colors.blue,),
            const Text(
                'Flutter is an open source framework by Google for building beautiful '),
            const SizedBox(height: 7,),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(shape: MaterialStateProperty
                    .all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                ), backgroundColor: MaterialStateProperty.
                all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(
                        Colors.pinkAccent)
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ),

          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return alertDia;
        },
        barrierDismissible: false,
        // its means that when you touch any place in the screen except dialog it will not go out of dialog
        barrierColor: Colors.blue.withOpacity(0.3)// barrier its mean that out of dialog
    );
  }
}