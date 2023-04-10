import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'next_page.dart';

class MainScreenTransition extends StatefulWidget {
  const MainScreenTransition({Key? key}) : super(key: key);

  @override
  State<MainScreenTransition> createState() => _MainScreenTransitionState();
}

class _MainScreenTransitionState extends State<MainScreenTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen Transition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        child: const NextPage(),
                        type: PageTransitionType.fade,
                      )
                      //  PageTransitionType.size and  PageTransitionType.scale must insert the alignment argument to work
                      );
                },
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text('Go To Another Page using fade')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const NextPage(),
                          type: PageTransitionType.scale,
                          alignment: Alignment
                              .bottomCenter //must use in PageTransitionType.scale
                          )
                      //  PageTransitionType.size and  PageTransitionType.scale must insert the alignment argument to work
                      );
                },
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text('Go To Another Page using scale')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const NextPage(),
                          type: PageTransitionType.size,
                          alignment: Alignment
                              .bottomCenter //must use in PageTransitionType.size
                          )
                      //  PageTransitionType.size and  PageTransitionType.scale must insert the alignment argument to work
                      );
                },
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text('Go To Another Page using size')),
          ],
        ),
      ),
    );
  }
}
