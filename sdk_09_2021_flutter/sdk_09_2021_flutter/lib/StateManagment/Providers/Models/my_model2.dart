import 'package:flutter/foundation.dart';

class MyModel2 extends ChangeNotifier {
  MyModel2({required this.someValue});

  String someValue = 'Hello';

  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2), () {
      someValue = 'Goodbye';
      print(someValue);
      notifyListeners();
    });
  }
}
