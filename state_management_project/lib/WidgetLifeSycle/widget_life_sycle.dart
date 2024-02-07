import 'package:flutter/material.dart';
class WidgetLifeCycle extends StatefulWidget {
  const WidgetLifeCycle({Key? key}) : super(key: key);

  @override
  State<WidgetLifeCycle> createState() => _WidgetLifeCycleState();
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
   int _counter=0;
   @override
  void initState() {
     print("initState was called");

     super.initState();
  }
  @override
  void dispose() {
    print("dispose was called");

    super.dispose();
  }
  @override
  void didUpdateWidget(covariant WidgetLifeCycle oldWidget) {
     print("didUpdateWidget was called");
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
     print('build was Called');
    return  Scaffold(

      appBar: AppBar(),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("$_counter",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed:
                (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                  return Scaffold( appBar: AppBar(title: const Text('Flutter'),),);
                }));

                } ,
                child: const Text("Go to another screen"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> setState(() {
        print("setState was called");
      _counter++; }
      ),),
    );
  }
}
