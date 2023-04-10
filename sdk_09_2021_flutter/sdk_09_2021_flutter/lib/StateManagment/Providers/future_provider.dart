import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/my_model2.dart';

class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      FutureProvider<MyModel2>(
        //   <--- FutureProvider
        initialData: MyModel2(someValue: 'default value'),
        create: (context) => someAsyncFunctionToGetMyModel(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Future Provider Example')),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green[200],
                    child: Consumer<MyModel2>(
                      builder: (context, myModel2, child) {
                        return RaisedButton(
                          child: Text('Do something'),
                          onPressed: () {
                            myModel2.doSomething();
                          },
                        );
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<MyModel2>(
                    //                    <--- Consumer
                    builder: (context, myModel2, child) {
                      return Text(myModel2.someValue);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Future<MyModel2> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(Duration(seconds: 3));
    return MyModel2(someValue: 'new data');
  }
}
