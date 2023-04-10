import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {Key? key, required this.buttonText, required this.onPress})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeManager.accent),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15))
      ),
      child: Text(buttonText),
      onPressed: onPress,
    );
  }
}
