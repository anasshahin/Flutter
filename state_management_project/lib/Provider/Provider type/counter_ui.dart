import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model_type.dart';
class CounterProvider extends StatelessWidget {
  const CounterProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var obj = Provider.of<ModelTypeProvider>(context).counter; // this is method you can use
    // where you declare variable & use it .
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              const Text("Please click button to increase number"),
              const SizedBox(height: 20,),
              Text("${context.watch<ModelTypeProvider>().counter}"),// watch listen = true
              const SizedBox(height: 20,),
              Consumer<ModelTypeProvider>(builder: (ctx,value,child){
                return
                Text("${value.counter}");}),
              Consumer <ModelTypeProvider>(builder: (ctx,value,child)=>ElevatedButton(onPressed:()=> value.increment(), child: const Icon(Icons.add)),),
              Selector<ModelTypeProvider,int>(builder: (context,value,child)=> Text("$value"),
                  selector: (ctx,val)=>val.num),
              const SizedBox(height: 20,),
              Selector<ModelTypeProvider,int>(builder: (context,value,child)=> Text("$value"),
                  // the different between Selector & Consumer is when i click in button
                  // the Widget is rebuild in Consumer but don't rebuild in Selector because the value is doesn't change
                  selector: (ctx,val)=>val.counter),
              const SizedBox(height: 20,),
    Text("${context.select<ModelTypeProvider,int>((value) => value.num)}"),
            ]),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>context.read<ModelTypeProvider>().increment(),// read listen = false
        child:const Icon(Icons.add) ,
      ),
    );
  }
}
