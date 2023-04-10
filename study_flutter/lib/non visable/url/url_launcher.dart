
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class URLLauncher extends StatefulWidget {
  const URLLauncher({Key? key}) : super(key: key);

  @override
  State<URLLauncher> createState() => _URLLauncherState();
}

class _URLLauncherState extends State<URLLauncher> {
  String youtubeLink = 'https://youtu.be/d4HM1qtvOKM';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
         child: ElevatedButton(
           child: const Text('go to youtube video'),
           onPressed: ()async{// because launchUrl its type is Future<bool>
           await canLaunchUrl(Uri.parse(youtubeLink))?
               throw 'the link is not work':await launchUrl(Uri.parse(youtubeLink),mode: LaunchMode.externalApplication,);
           },
         ),
      ),
    );
  }
}
