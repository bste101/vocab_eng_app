/* 
====================================================================================================================
didn't finished
====================================================================================================================
*/
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/QuizGame.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/model/player_data.dart';
import 'main_menu.dart';

class GameOverMenu extends StatefulWidget {
  int score;
  GameOverMenu({super.key , required this.score});

  @override
  State<GameOverMenu> createState() => _GameOverMenuState(score);
}

class _GameOverMenuState extends State<GameOverMenu> {
  _GameOverMenuState(int score);

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 210,
                  height: 230,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/${Globals.labelNameSprite}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SelectMenu(),
                    ));
                  },
                  icon: Image.asset(
                    "assets/images/${Globals.buttonstartSprite}",
                  ),
                  iconSize: 200,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Image.asset(
                "assets/images/${Globals.iconsettingSprite}",
              ),
              iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}