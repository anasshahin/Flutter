import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier{
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}
