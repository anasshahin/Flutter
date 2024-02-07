
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class LedControl extends StatefulWidget {
    LedControl({Key? key, app }) : super(key: key);
FirebaseApp ?app;
  @override
  State<LedControl> createState() => _LedControlState();
}

class _LedControlState extends State<LedControl> {
  final FirebaseDatabase referenceDatabase=FirebaseDatabase.instance;
  bool ledState=false;
  bool doorState=false;
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  late DatabaseReference _counterRef;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
//     //اخد مرجع بيانات الداتا ووصول الي مكان تخزين معين باسم
       _counterRef = database.reference().child('notification');

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final ref = referenceDatabase.ref();



    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text('mom\'s app  ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding:  MaterialStateProperty.all(const EdgeInsets.all(30)),
               shape: MaterialStateProperty.all( RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
               )),

              ),
              onPressed: (){
                setState(() {
                  ledState= !ledState;
                  if(ledState) ref.child('output').child('state').set('on').asStream();
                  if(!ledState) ref.child('output').child('state').set('off').asStream();
                });

              },
              child: const Text('Change the state of led',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold )),
            ),

            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding:  MaterialStateProperty.all(const EdgeInsets.all(30)),
                shape: MaterialStateProperty.all( RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),

              ),
              onPressed: (){
                setState(() {
                  doorState= !doorState;

                  if(!doorState) ref.child('door').child('state').set('off').asStream();
                  if(doorState) ref.child('door').child('state').set('on').asStream();
                });
              },
              child: const Text('Change the state of door',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold )),
            ),




            Flexible(               //عمل قائمة للادخالات التي موجودة في الداتا بيز
              child: FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: _counterRef, //المرجع بيانات قائمة معينة في الداتا معرفة اعلي في فتح الصفحة
                  itemBuilder: (BuildContext context,    //بناء جلب البيانات
                      DataSnapshot snapshot,    // الداتا بترجع في لقطة بيانات لها هنا
                      Animation<dynamic>animation,
                      dynamic index
                      ){

                    var i =snapshot.key;
                    var m =snapshot.value.toString();
                    if (m=="on"){
                      AwesomeNotifications().createNotification(
                          content: NotificationContent(
                              id: 10, channelKey: "Dangerous",
                            title: "someone near the kitchen",
                            body: "maybe he is bob ",

                          ));
                    }

                       return Container(
                         decoration:  BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           color: Colors.pink,
                         ),
                         margin:const EdgeInsets.all(40),
                         padding: const EdgeInsets.all(25),
                         child:Text(m=="on"?'wow some one is near the kitchen be careful mom':'every think is okay no one is near kitchen',
                         style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold , color: Colors.white),
                         ) ,
                       );

                  }
              ),
            ),


ElevatedButton(onPressed: (){
  showDialog(
  context: context,
    builder: (BuildContext context) {
return
      AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
          // Use Material color picker:
          //
          // child: MaterialPicker(
          //   pickerColor: pickerColor,
          //   onColorChanged: changeColor,
          //   showLabel: true, // only on portrait mode
          // ),
          //
          // Use Block color picker:
          //
          // child: BlockPicker(
          //   pickerColor: currentColor,
          //   onColorChanged: changeColor,
          // ),
          //
          // child: MultipleChoiceBlockPicker(
          //   pickerColors: currentColors,
          //   onColorsChanged: changeColors,
          // ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {

              setState(() => currentColor = pickerColor);
              ref.child('green').child('state').set(currentColor.green.toString()).asStream();
              ref.child('red').child('state').set(currentColor.red.toString()).asStream();
              ref.child('blue').child('state').set(currentColor.blue.toString()).asStream();
              Navigator.of(context).pop();

            },
          ),
        ],
      );
    },
);}, child:const Text('Color '))
      ],
        ),
      ),
    );
  }

}
/*
 ListTile(    // رجوع علي هيئة ليست
                      trailing: const Icon(Icons.wifi,color:  Color(0xFFAC2F09),size: 30,),
                      //عرض بيانات من لقطة البيانات المستلمة ووصول الي قيمة الاولي
                      title:Text(i!,
                        style: const TextStyle(
                            fontSize: 30,color: Color(0x8C6E341A)
                            ,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                      subtitle:Text(m,
                        style: const TextStyle(
                            fontSize: 50,color: Color(0x8CDD4D0B),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),) ,
                    );

 */