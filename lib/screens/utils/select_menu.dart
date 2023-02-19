import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

import 'hud.dart';

class SelectMenu extends StatelessWidget {
  
  static const id = 'SelectMenu';
  
  final MyGame gameRef;
  
  const SelectMenu({
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
                    image: AssetImage("assets/images/${Globals.backgroundSprite}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Easy button
            Positioned(
              left: 0,
              bottom: 330,
              child: GestureDetector(
                onTap: () {
                  gameRef.startGamePlay();
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.buttonEasySprite}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Normal button
            Positioned(
              left: 0,
              bottom: 320,
              child: GestureDetector(
                onTap: () {
                  gameRef.startGamePlay();
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.buttonNormalSprite}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Hard button
            Positioned(
              left: 0,
              bottom: 310,
              child: GestureDetector(
                onTap: () {
                  gameRef.startGamePlay();
                  gameRef.overlays.remove(SelectMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.buttonHardSprite}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}