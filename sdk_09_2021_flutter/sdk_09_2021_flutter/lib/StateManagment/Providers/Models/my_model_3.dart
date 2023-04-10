import 'package:flutter/foundation.dart';

class MyModel3 with ChangeNotifier {   //      <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier {   //        <--- AnotherModel
  int someValue = 0;

  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}
