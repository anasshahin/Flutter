import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
class ToastWidget extends StatefulWidget {
  const ToastWidget({Key? key}) : super(key: key);

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToastWidget'),
      ),
      body: Center(child: Text('Toast mode',style: Theme.of(context).textTheme.bodyLarge,)),
      floatingActionButton:
      buildShowToast(context),
      // see it in pub.dev
    );
  }

  FloatingActionButton buildShowToast(BuildContext context) {
    return FloatingActionButton(onPressed:(){
      showToast('This is normal toast with animation',
          context: context,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          animation: StyledToastAnimation.slideFromTop,
          reverseAnimation: StyledToastAnimation.slideToTop,
          position: const StyledToastPosition(align:Alignment.bottomCenter,offset: 50.0 ),// we can change it
          // see the definition in file of StyledToastPosition
          startOffset: const Offset(0.0, -3.0),
          reverseEndOffset: const Offset(0.0, -3.0),
          duration: const Duration(seconds: 4),
          //Animation duration   animDuration * 2 <= duration
          animDuration: const Duration(seconds: 1),
          curve: Curves.elasticOut,
          reverseCurve: Curves.fastOutSlowIn);
    } );
  }
}
