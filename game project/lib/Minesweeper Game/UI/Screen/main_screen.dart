import 'dart:async';

import 'package:flutter/material.dart';


import '../../prefs_state/prefs_states.dart';
import '../Theme/colors.dart';
import '../Utilis/game_helper.dart';
import '../animation_widget_ui.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MineSweeperGameNew game;
  late Timer timer ;
  int second=60;
  int minute=7;

  void timeDecrease(){

    timer =   Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        timer.cancel();
      }else{
      setState(() {if (game.gameOver==false&&game.gameWin==false) {
        if (second !=0){
          second--;}
        if (second == 0&&minute != 0){
          second = 60;
          minute--;
          second--;
        }
        if (second == 0&&minute == 0){
          game.gameOver=true;
        }
      }});

    }});


  }

  @override
  void initState() {
    super.initState();
    timeDecrease();
    game = MineSweeperGameNew(col: 6, row: 6, cells: 36, map: List.generate(
        6,
            (x) =>
            List.generate(
                6, (y) => Cell(row: x, col: y, content: '', reveal: false))));
    game.generateMap(10);
  }
  bool switchController=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('MineSweeper'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){

            setState(() {
              switchController=!switchController;
              Prefs.setBoolValue('AppearanceMode',switchController);
              AppColor.primaryColor=Prefs.getBoolValue("AppearanceMode")??true?const Color(0xFF1f1b18):const Color(0xFF14AAF5);
              AppColor.lightPrimaryColor=Prefs.getBoolValue("AppearanceMode")??true?const Color(0xFF3F3A36):const Color(0xFF1E2F97);
              AppColor.clickedCard=Prefs.getBoolValue("AppearanceMode")??true?const Color(0xFF3F3A36):const Color(0xFF00008b);
            });

          }, icon: Icon(Prefs.getBoolValue('AppearanceMode')??true
              ? Icons.dark_mode
              : Icons.light_mode),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      color: AppColor.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.timer,
                          color: AppColor.accentColor,
                          size: 34.0,
                        ),
                        Text(
                          '$minute:$second',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 500.0,
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: 36,
                  itemBuilder: (BuildContext ctx, index) {
                    Color cellColor = game.gameMap[index].reveal
                        ? AppColor.clickedCard
                        : AppColor.lightPrimaryColor;
                    return GestureDetector(
                      onTap: game.gameOver||game.gameWin
                          ? null
                          : () {
                              setState(() {
                                game.getClickedCell(game.gameMap[index]);
                              });
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cellColor,
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: Center(
                          child: Text(
                            game.gameMap[index].reveal
                                ?"${game.gameMap[index].content}":"",
                            style: TextStyle(
                              color:game.gameMap[index].reveal?
                              game.gameMap[index].content =='X'?Colors.red
                                  :AppColor.letterColors[game.gameMap[index].content]
                                  :Colors.transparent,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                game.gameWin ?  const ScaleWidget(): const SizedBox(),
                Text(
                  game.gameWin ? "You Win ": "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0
                  ),
                ),
                Text(
                  game.gameOver ? "You Lose ": "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            RawMaterialButton(onPressed: (){
              setState(() {
                game.resetGame(10);
                second = 60;
                minute= 7;
                game.gameOver= false;
                game.gameWin= false;
                game.cells=36;
                game.unSelectNum=36;
              });
            },fillColor: AppColor.lightPrimaryColor,elevation: 0,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 18.0),
                child :const Text('Reseat',style:TextStyle(
                  color:Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                )),
            ),
            const SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}
