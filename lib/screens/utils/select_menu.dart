/* 
====================================================================================================================
didn't finished Normal and Hard Mode
====================================================================================================================
*/

import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/getjson.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/games/quizgame.dart';

import 'hud.dart';

class SelectMenu extends StatelessWidget {
  static const id = 'SelectMenu';

  final MyGame gameRef;
  String langname;

  SelectMenu({
    Key? key,
    required this.gameRef,
    required this.langname,
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
              left: 100,
              bottom: 400,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GetJson(langname: 'One', assettoload: '', gameRef: gameRef,),
                  ));
                  gameRef.overlays.add(QuizGame.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                icon: Image.asset("assets/images/${Globals.buttonEasySprite}"),
                iconSize: 180,
              ),
            ),
            // Normal button
            Positioned(
              left: 100,
              bottom: 300,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GetJson(langname: 'Two', assettoload: '', gameRef: gameRef,),
                  ));
                  gameRef.overlays.add(QuizGame.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                icon:
                    Image.asset("assets/images/${Globals.buttonNormalSprite}"),
                iconSize: 180,
              ),
            ),
            // Hard button
            Positioned(
              left: 100,
              bottom: 200,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GetJson(langname: 'Three', assettoload: '', gameRef: gameRef,),
                  ));
                  gameRef.overlays.add(QuizGame.id);
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                icon: Image.asset("assets/images/${Globals.buttonHardSprite}"),
                iconSize: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
