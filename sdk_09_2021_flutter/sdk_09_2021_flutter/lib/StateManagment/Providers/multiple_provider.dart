import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/my_model_3.dart';

class MultipleProviderExample extends StatelessWidget {
  const MultipleProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Provider Example')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel3>(
                    //            <--- MyModel Consumer
                    builder: (context, myModel3, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          // We have access to the model.
                          myModel3.doSomething();
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel3>(
                  //              <--- MyModel Consumer
                  builder: (context, myModel3, child) {
                    return Text(myModel3.someValue);
                  },
                ),
              ),
            ],
          ),
          // SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<AnotherModel>(
                    //      <--- AnotherModel Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          myModel.doSomething();
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.yellow[200],
                child: Consumer<AnotherModel>(
                  //        <--- AnotherModel Consumer
                  builder: (context, anotherModel, child) {
                    return Text('${anotherModel.someValue}');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
