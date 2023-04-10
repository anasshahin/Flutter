import 'package:flutter/material.dart';
import 'package:study_flutter/Multi%20Screens/tab%20bar/clock_timer.dart';
import 'package:study_flutter/Multi%20Screens/tab%20bar/study.dart';
class TabBarMainScreen extends StatelessWidget {
  const TabBarMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController
       (length: 2,
          child: Scaffold(
       appBar: AppBar(// put inside appBar parameter TabBar Widget
         title: const Text('TabBarMainScreen'),
         bottom: const TabBar(
           tabs: [
             Tab(icon: Icon(Icons.access_time_rounded),text: 'Timer'),
             Tab(icon: Icon(Icons.abc),text: 'Study'), // we put two tab because length = 2
           ],
         ),
       ),
            body: const TabBarView(
              children: [
                ClockTimer(),
                Study(),
              ],
            ),
     ));
  }
}
