import 'dart:async';

import 'package:flutter/material.dart';

import '../../prefs_state/prefs_states.dart';
import '../../router/constant_router.dart';
import '../Theme/colors.dart';
import '../Utilis/icons_helper.dart';


class MinesweeperLevelScreen extends StatefulWidget {
  const MinesweeperLevelScreen({Key? key}) : super(key: key);

  @override
  State<MinesweeperLevelScreen> createState() => _MinesweeperLevelScreenState();
}

class _MinesweeperLevelScreenState extends State<MinesweeperLevelScreen> {
  bool visible = true;
  bool visible1 = true;
  bool visible2 = true;
  bool visible3 = true;
  double height = 100;
  double height1 = 100;
  double height2 = 100;
  double height3 = 100;
  double width = 150;
  double width1 = 150;
  double width2 = 150;
  double width3 = 150;
  double size = 40;
  double size1 = 40;
  double size2 = 40;
  double size3 = 40;
  Color color = AppColor.clickedCard;
  bool switchController = true;
 // BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    double widthAll = MediaQuery.of(context).size.width;
    double varyHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar:AppBar(
         backgroundColor: AppColor.primaryColor,
         title: const Text('MineSweeper'),
         centerTitle: true,
         elevation: 0.0,
         actions: [
           IconButton(
             onPressed: () {
               setState(() {
                 switchController = !switchController;
                 Prefs.setBoolValue('AppearanceMode', switchController);
                 AppColor.primaryColor =
                 Prefs.getBoolValue("AppearanceMode") ?? true
                     ? const Color(0xFF1f1b18)
                     : const Color(0xFF14AAF5);
                 AppColor.lightPrimaryColor =
                 Prefs.getBoolValue("AppearanceMode") ?? true
                     ? const Color(0xFF3F3A36)
                     : const Color(0xFF1E2F97);
                 AppColor.clickedCard =
                 Prefs.getBoolValue("AppearanceMode") ?? true
                     ? const Color(0xFF3F3A36)
                     : const Color(0xFF00008b);
               });
             },
             icon: Icon(Prefs.getBoolValue('AppearanceMode') ?? true
                 ? Icons.dark_mode
                 : Icons.light_mode),
           )
         ],
       ),
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedOpacity(
                opacity: visible ? 1 : 0,
                duration: const Duration(seconds: 2),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      visible = false;
                      height = varyHeight;
                      height1 = 0;
                      height2 = 0;
                      height3 = 0;
                      width= widthAll-33 ;
                      size = 0;
                      size1 = 0;
                      size2 = 0;
                      size3 = 0;
                    });
                    Timer(const Duration(milliseconds: 800), (){ Navigator.of(context).pushNamed(easy);});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize:MainAxisSize.min ,
                        children: [
                          Image.asset('assets/1.png',fit: BoxFit.cover,width: width),
                             Center(
                               child: Text('easy level',style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.bold,
                                fontSize: size-10,
                            )),
                             ),
                            Icon(MyFlutterApp.bomb_1,size: size),
                        ],
                      ),
                      onEnd: () {
                        setState(() {
                          height = 100;
                          height1 = 100;
                          height2 = 100;
                          height3 = 100;
                          visible = true;
                          width = 150;
                          size=40;
                          size1=40;
                          size2=40;
                          size3=40;

                        });



                      },
                      curve: Curves.linear,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      height: height,
                     // width: width,
                      decoration: BoxDecoration(
                        color: AppColor.clickedCard,
                      //  borderRadius: borderRadius,
                      ),
                    ),
                  ),
                ),

              ),
              AnimatedOpacity(
                opacity: visible1 ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      visible1 = false;
                      height1 = varyHeight;
                      height2 = 0;
                      height3 = 0;
                      height = 0;
                      width1= widthAll- 33;
                      size1 = 0;
                      size = 0;
                      size2 = 0;
                      size3 = 0;
                    });
                    Timer(const Duration(milliseconds: 800), (){ Navigator.of(context).pushNamed(medium);});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize:MainAxisSize.min ,
                        children: [
                          Image.asset('assets/12.jpeg',fit: BoxFit.cover,width: width1),
                          Center(
                            child: Text('medium level ',style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: size1-15,
                            )),
                          ),
                           Icon(MyFlutterApp.bomb_explosion,size: size1,),
                        ],
                      ),

                      onEnd: () {
                        setState(() {
                          height1 = 100;
                          height2 = 100;
                          height3 = 100;
                          height = 100;
                          visible1 = true;
                          width1 = 150;
                          size1=40;
                          size=40;
                          size2=40;
                          size3=40;
                        });

                      },
                      curve: Curves.linear,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      height: height1,
                     // width: width,
                      decoration: BoxDecoration(
                        color: AppColor.clickedCard,
                     //   borderRadius: borderRadius,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: visible2 ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      visible2 = false;
                      height2 = varyHeight;
                      height = 0;
                      height1 = 0;
                      height3 = 0;
                      width2= widthAll-33 ;
                      size2 = 0;
                      size = 0;
                      size1 = 0;
                      size3 = 0;
                    });
                    Timer(const Duration(milliseconds: 800), (){ Navigator.of(context).pushNamed(hard);});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize:MainAxisSize.min ,
                        children: [
                          Image.asset('assets/123.jpeg',fit: BoxFit.cover,width: width2),
                          Center(
                            child: Text('hard level ',style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: size2-10,
                            )),
                          ),
                           Icon(MyFlutterApp.bombs,size: size2,),
                        ],
                      ),

                      onEnd: () {
                        setState(() {
                          height2 = 100;
                          height = 100;
                          height1 = 100;
                          height3 = 100;
                          visible2 = true;
                          width2 = 150;
                          size2=40;
                          size=40;
                          size1=40;
                          size3=40;
                        });
                      },
                      curve: Curves.linear,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      height: height2,
                     // width: width,
                      decoration: BoxDecoration(
                        color: AppColor.clickedCard,
                       // borderRadius: borderRadius,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: visible3 ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      visible3 = false;
                      height3 = varyHeight;
                      height = 0;
                      height1 = 0;
                      height2 = 0;
                      width3= widthAll-33 ;
                      size3 = 0;
                      size2 = 0;
                      size1 = 0;
                      size = 0;
                    });
                    Timer(const Duration(milliseconds: 800), (){ Navigator.of(context).pushNamed(veryHard);});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize:MainAxisSize.min ,
                      children: [
                        Image.asset('assets/1234.jpeg',fit: BoxFit.cover,width: width3),
                        Center(
                          child: Text('very hard level',style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: size3-18,
                          )),
                        ),
                         Icon(MyFlutterApp.cluster_bomb,size: size3,),

                      ],
                    ),

                      onEnd: () {
                        setState(() {
                          height3 = 100;
                          height = 100;
                          height1 = 100;
                          height2 = 100;
                          visible3 = true;
                          width3 = 150;
                          size3=40;
                          size=40;
                          size1=40;
                          size2=40;
                        });
                      },
                      curve: Curves.linear,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      height: height3,
                     // width: width,
                      decoration: BoxDecoration(
                        color: AppColor.clickedCard,
                      //  borderRadius: borderRadius,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
