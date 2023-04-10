import 'package:flutter/material.dart';
class GridViewWork extends StatelessWidget {
  const GridViewWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: GridView(
          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:200, // تحدد عرض العنصر
          childAspectRatio: 2, // تحدد قيمة طول العنصر بناء على عرضه
              // يعني لو 2 القيمة الي دخلت معناها انه اطول رح يكون نصف قيمة العرض
          crossAxisSpacing: 10,//تمثل البعد بالعرض للعناصر عن بعضها
          mainAxisSpacing: 20// تمثل البعد بطول للعناصر عن بعضها
          ),

          children:  [
            Container(color: Colors.red,
                height: double.maxFinite,

              child: const Icon(Icons.ac_unit_rounded),

            ),
            Container(color: Colors.blue,height: double.maxFinite,
                child: const Icon(Icons.ac_unit)),
            Container(color: Colors.green,height: double.maxFinite,
              child: const Icon(Icons.ac_unit_rounded),),
            Container(color: Colors.grey,height: double.maxFinite,
              child: const Icon(Icons.ac_unit_rounded),),
            Container(color: Colors.yellow,height: double.maxFinite,
              child: const Icon(Icons.ac_unit_rounded),),
            Container(color: Colors.black,height: double.maxFinite,
              child: const Icon(Icons.ac_unit_rounded,color: Colors.white,),),

          ],
        ),
      ),
    );
  }
}
class GridViewWork1 extends StatelessWidget {
  const GridViewWork1({Key? key}) : super(key: key);

  Widget iconAndColor(Color color,IconData iconData){

    return Container(height: double.maxFinite,
        child:  Icon(iconData),
      decoration: BoxDecoration(
        color: color,
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),// هون وضعنا شفافية للون
              // هذا هو الون الي رح يبدا من عنده
              color // هذا هو لون النهاية
            ],
            begin: Alignment.topLeft,// مكان بدا اخذ اول لون
            end: Alignment.bottomRight,// مكان انتهاء التحويل ل اخر لون
          ),
          borderRadius: BorderRadius.circular(25)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: GridView(

          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:200, // تحدد عرض العنصر
              childAspectRatio: 2, // تحدد قيمة طول العنصر بناء على عرضه
              // يعني لو 2 القيمة الي دخلت معناها انه اطول رح يكون نصف قيمة العرض
              crossAxisSpacing: 10,//تمثل البعد بالعرض للعناصر عن بعضها
              mainAxisSpacing: 20// تمثل البعد بطول للعناصر عن بعضها
          ),

          children:  [

            iconAndColor(Colors.red,Icons.ac_unit),
            iconAndColor(Colors.green,Icons.ac_unit),
            iconAndColor(Colors.blue,Icons.ac_unit),
            iconAndColor(Colors.black,Icons.ac_unit),
            iconAndColor(Colors.yellow,Icons.ac_unit),
            iconAndColor(Colors.orange,Icons.ac_unit),

          ],
        ),
      ),
    );
  }
}

