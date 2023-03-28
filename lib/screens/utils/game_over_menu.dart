/* 
====================================================================================================================
didn't finished
====================================================================================================================
*/
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';
import 'package:vocab_eng_app/screens/utils/select_menu.dart';

class GameOverMenu extends StatefulWidget {
  final int score;
  const GameOverMenu({super.key, required this.score});

  @override
  // ignore: no_logic_in_create_state
  State<GameOverMenu> createState() => _GameOverMenuState(score);
}

class _GameOverMenuState extends State<GameOverMenu> {
  int score;
  _GameOverMenuState(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/${Globals.backgroundStartSprite}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            child: Container(
              width: 400,
              height: 700,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.boxgameOver}"),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            child: Container(
              width: 400,
              height: 700,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.boxgameOver}"),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(
            bottom: 400,
            left: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your score is : $score',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "SecularOne-Regular",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 110,
            bottom: 220,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  // in changelog 1 we will pass the langname name to ther other widget class
                  // this name will be used to open a particular JSON file
                  // for a particular language
                  builder: (context) => const SelectMenu(),
                ));
              },
              color: Colors.yellow,
              splashColor: Colors.yellow,
              highlightColor: const Color.fromARGB(255, 233, 202, 0),
              minWidth: 180.0, // Adjust to fit within background dimensions
              height: 75.0, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "Play Again",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "SecularOne-Regular",
                  fontSize: 24.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Positioned(
            left: 125,
            bottom: 110,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  // in changelog 1 we will pass the langname name to ther other widget class
                  // this name will be used to open a particular JSON file
                  // for a particular language
                  builder: (context) => const MainMenu(),
                ));
              },
              color: Colors.white,
              splashColor: Colors.white,
              highlightColor: const Color.fromARGB(255, 91, 91, 91),
              minWidth: 150.0, // Adjust to fit within background dimensions
              height: 60.0, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "Back",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "SecularOne-Regular",
                  fontSize: 22.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
