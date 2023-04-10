import 'package:flutter/material.dart';

class ExState extends StatefulWidget {
  const ExState({Key? key}) : super(key: key);

  @override
  State<ExState> createState() => _ExStateState();
  // تخزن قيمة التغيير
}

class _ExStateState extends State<ExState> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('if you press the button you will increase the number'),
            Text('$x'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {// تحدد الجزء المراد اعادة بنائه
              // اي جيع الاجزاء المرتبطة بالتغيير  x تقوم ب اعادة بنائها
              x++;
            });
          },
          label: const Text('add'),
          icon: const Icon(Icons.add)),
    );
  }
}
