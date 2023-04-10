import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool passwordVisible = true;
  Color labelColor = Colors.greenAccent;
  Color textColor = Colors.white;
  Color backColor = Colors.black;
  Color iconColor = Colors.blueAccent;
  Color filledColor = Colors.white60;
  bool filledControlColor = true;
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFieldWidget'),
      ),
      backgroundColor: backColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child:  TextField(
                  controller: myController,
                  keyboardType: TextInputType.text, // بتحدد نوع الكيبورد
                  decoration: InputDecoration(
                    filled: filledControlColor,
                    fillColor:filledColor ,
                    labelText: 'name ',
                    hintText: 'fname lname',

                    border: OutlineInputBorder(
                      borderSide:  const BorderSide(width: 2, color:Colors.green ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    labelStyle: TextStyle(fontSize: 20,color: labelColor),
                    hintStyle: TextStyle(fontSize: 12,color: textColor),
                    icon:  Icon(Icons.person,color:iconColor ,),
                  ),
                   style: TextStyle(
                     color: textColor,
                   ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child:  TextField(
                  keyboardType: TextInputType.emailAddress, // بتحدد نوع الكيبورد
                  decoration: InputDecoration(

                    filled: filledControlColor,
                   fillColor: filledColor,
                   enabledBorder:OutlineInputBorder(
                      borderSide:  const BorderSide(width: 2, color:Colors.green ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    labelText: 'email',
                    hintText: 'email@gmail.com',
                    labelStyle: TextStyle(fontSize: 20,color: labelColor),
                    hintStyle: TextStyle(fontSize: 12,color: textColor),
                    prefixIcon: Icon(Icons.email,color:iconColor ),
                    suffixIcon: Icon(Icons.email_sharp,color: iconColor),
                  ),
                   style: TextStyle(color: textColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  // بتحدد نوع الكيبورد
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide:  const BorderSide(width: 2, color:Colors.green ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    filled: filledControlColor,
                      fillColor: filledColor,
                      labelText: 'password',
                      hintText: '****************',
                      labelStyle:  TextStyle(fontSize: 20,color: labelColor),
                      hintStyle:  TextStyle(fontSize: 12,color: textColor),

                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible=!passwordVisible;

                            });
                          }, icon:  Icon(passwordVisible?Icons.visibility:Icons.visibility_off),color: iconColor,)
                  ),
                  style: TextStyle(color: textColor),
                  obscureText: passwordVisible,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child:  TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone, // بتحدد نوع الكيبورد
                  decoration: InputDecoration(
                    prefixStyle:const TextStyle(fontSize: 15),
                    prefixText: '+962 ',
                    enabledBorder:OutlineInputBorder(
                      borderSide:  const BorderSide(width: 2, color:Colors.green ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    fillColor: filledColor,
                    filled: filledControlColor,
                    labelText: 'phone',
                    hintText: '07XXXXXXXX',
                    labelStyle: TextStyle(fontSize: 20,color: labelColor),
                    hintStyle: TextStyle(fontSize: 12,color: textColor),
                  ),
                  style: TextStyle(color: textColor),
                ),
              ),
              Container(
                margin:const EdgeInsets.all(10),
                child:  TextField(
                  controller: myController1,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  keyboardType: TextInputType.text, // بتحدد نوع الكيبورد
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide:  const BorderSide(width: 2, color:Colors.green ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    fillColor: filledColor,
                    filled: filledControlColor,
                    labelText: 'email',
                    hintText: 'email@gmail.com',
                    labelStyle: const TextStyle(fontSize: 20),
                    hintStyle: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                myController1.text=myController.text;
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lime),
                  padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 10, 30, 10))
                ),
                  child:  Text('get value',
                   // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,color: backColor),
                  ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed: ()=>setState(() {
         labelColor = Colors.greenAccent==labelColor?Colors.redAccent:Colors.greenAccent;
         textColor = textColor==Colors.white?Colors.black:Colors.white;
         backColor = backColor==Colors.black?Colors.white:Colors.black;
         //filledColor = Colors.white60;
         filledControlColor != filledControlColor;
      }),backgroundColor: backColor==Colors.black?Colors.white:Colors.black,
      ) ,
    );
  }
}
