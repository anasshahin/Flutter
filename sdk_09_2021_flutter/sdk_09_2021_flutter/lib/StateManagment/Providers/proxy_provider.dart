import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/my_model_4.dart';

class ProxyProviderExample extends StatelessWidget {
  const ProxyProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proxy Provider Example')),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel4>(
                    //          <--- MyModel Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          myModel.doSomething('Goodbye');
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel4>(
                  //            <--- MyModel Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(20),
              color: Colors.red[200],
              child: Consumer<AnotherModel2>(
                //          <--- AnotherModel Consumer
                builder: (context, anotherModel, child) {
                  return RaisedButton(
                    child: Text('Do something else'),
                    onPressed: () {
                      anotherModel.doSomethingElse();
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
