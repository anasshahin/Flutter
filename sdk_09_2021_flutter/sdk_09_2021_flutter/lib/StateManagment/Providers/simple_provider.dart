import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/my_model.dart';

class SimpleProvider extends StatelessWidget {
  const SimpleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // no provider
    // final myModel = Provider.of<MyModel>(context, listen: false); // will cause error (run-time error)
    return ChangeNotifierProvider<MyModel>( //    <--- Provider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Simple Provider')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //   <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          // We have access to the model.
                          myModel.doSomething();
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(   //    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
