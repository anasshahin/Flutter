import 'package:flutter/material.dart';

class ContainerComponent extends StatelessWidget {
  final String title;
  final Widget info;

  const ContainerComponent({Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400), //BACK change it
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center),
            info,
          ],
        ),
      ),
    );
  }
}
