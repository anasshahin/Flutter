import 'package:flutter/foundation.dart';

class MyModel4 with ChangeNotifier {   //    <--- MyModel

  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel2 {    //         <--- AnotherModel

  MyModel4 _myModel;

  AnotherModel2(this._myModel);

  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
