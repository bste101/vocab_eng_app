/* 
====================================================================================================================
didn't finished Normal and Hard Mode
====================================================================================================================
*/

import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/games/quizgame.dart';
import 'package:vocab_eng_app/games/quizgamethree.dart';
import 'package:vocab_eng_app/games/quizgametwo.dart';

import 'hud.dart';

class SelectMenu extends StatelessWidget {
  static const id = 'SelectMenu';

  final MyGame gameRef;
  late String langname;

  SelectMenu({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background image container
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
              bottom: 600,
              left: 100,
              child: Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/${Globals.buttonLevelSprite}"),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            // Easy button
            Positioned(
              left: 110,
              bottom: 450,
              child: MaterialButton(
                onPressed: () {
                  gameRef.overlays.add(QuizGame.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 75.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "One Word",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 18.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Normal button
            Positioned(
              left: 110,
              bottom: 350,
              child: MaterialButton(
                onPressed: () {
                  gameRef.overlays.add(QuizGameTwo.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 75.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Two Word",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 18.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Hard button
            Positioned(
              left: 110,
              bottom: 250,
              child: MaterialButton(
                onPressed: () {
                  gameRef.overlays.add(QuizGameThree.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 75.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Three Word",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 18.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
