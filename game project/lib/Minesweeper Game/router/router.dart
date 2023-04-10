import 'package:flutter/material.dart';

import '../UI/Screen/easy_level_screen.dart';
import '../UI/Screen/first_screen.dart';
import '../UI/Screen/hard_level_screen.dart';
import '../UI/Screen/main_screen.dart';
import '../UI/Screen/minesweeper_level_screen.dart';
import '../UI/Screen/vary_hard_level_screen.dart';
import 'constant_router.dart';
class MyRoute2 {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case firstUi:{
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      }

      case multiLevel:{

        return MaterialPageRoute(builder: (_) => const MinesweeperLevelScreen());
      }

      case easy:{
        return MaterialPageRoute(builder: (_) => const EasyLevelScreen());
      }
      case medium:{
      return MaterialPageRoute(builder: (_) => const MainScreen());
    }
      case hard:{
      return MaterialPageRoute(builder: (_) => const HardLevelScreen());
    }
      case veryHard:{
        return MaterialPageRoute(builder: (_) => const VaryHardLevelScreen());
      }
      default:
        {
          final arg = settings.name as String;
          return MaterialPageRoute(
              builder: (_) => UndefineRoute(routeName: arg));
        }
    }
  }
}

class UndefineRoute extends StatelessWidget {
  const UndefineRoute({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routeName is Undefine Route',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
