import 'package:flutter/material.dart';
class PaddingAndMargin extends StatefulWidget {
  const PaddingAndMargin({Key? key}) : super(key: key);

  @override
  State<PaddingAndMargin> createState() => _PaddingAndMarginState();
}

class _PaddingAndMarginState extends State<PaddingAndMargin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('PaddingAndMargin')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.red,
            child: Row(
              children: const [
                Text('margin'),
                Text(' all')
              ],
            ),
          ),
      Container(
      margin: const EdgeInsets.
      fromLTRB(30, 10, 30, 10),// تعمل ازاحة لكل جهة حسب القيمة الي انا بعطيها للجهة
        color: Colors.yellowAccent,
        child: Row(
          children: const [
            Text('margin'),
            Text(' fromLTRB'),
          ],
        ),
      ),
          Container(
            margin:  const EdgeInsets.
            symmetric(horizontal: 10,vertical: 20),// القيمة الي بتدخل لل هوريزنتل بتدخل ل اليمن و اليسار و القيمة الي بتدخل ل فيرتيكل بتدخل ل الاعلى و الاسفل شوف الكلاس من جوا اذا ما فهمت
            color: Colors.grey,
            child: Row(
              children: const [
                Text('margin'),
                Text(' symmetric')

              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.
            only(top: 12),// fromLTRB   هي نفس
            // لكن ليس بضرورة ان اسند لها كل القيم ممكن اسند قيمة او ثنتين حسب حاجتي ممكن اسندهم كلهم
            color: Colors.blueGrey,
            child: Row(
              children: const [
                Text('margin'),
                Text(' only')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.
            only(top: 12),// fromLTRB   هي نفس
            // لكن ليس بضرورة ان اسند لها كل القيم ممكن اسند قيمة او ثنتين حسب حاجتي ممكن اسندهم كلهم
            color: Colors.greenAccent,
            child: Row(
              children: const [
                Text('padding'),
                Text(' only')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.
            symmetric(horizontal: 10,vertical: 20),// fromLTRB   هي نفس
            // لكن ليس بضرورة ان اسند لها كل القيم ممكن اسند قيمة او ثنتين حسب حاجتي ممكن اسندهم كلهم
            color: Colors.grey,
            child: Row(
              children: const [
                Text('padding'),
                Text(' symmetric')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.
            fromLTRB(30, 10, 30, 10),// تعمل ازاحة لكل جهة حسب القيمة الي انا بعطيها للجهة
            color: Colors.yellowAccent,
            child: Row(
              children: const [
                Text('padding'),
                Text(' fromLTRB'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: Row(
              children: const [
                Text('padding'),
                Text(' all')
              ],
            ),
          ),
          Container(
            color: Colors.lightGreenAccent,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                child: Container(
                  alignment:Alignment.center ,
                  child: const Text('padding Class ',style: TextStyle(fontSize: 25)),
                  color: Colors.greenAccent,
                ),
                height: 200,
                width: 200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
