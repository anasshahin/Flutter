import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/Provider/App%20theme/provider_model.dart';
class AppThemeWidget extends StatelessWidget {
  const AppThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
         drawer: Drawer(child:
         Center(child: Switch(
             value: Provider.of<ProviderModel>(context,listen: true).swVal,// important
             onChanged: (val){
               Provider.of<ProviderModel>(context,listen: false).switchChange(val);// when change value listen:false
             }),)),
      )
    ;
  }
}
