import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/utils/setting_menu.dart';

import 'hud.dart';

class MainMenu extends StatelessWidget {
  
  static const id = 'MainMenu';
  
  final MyGame gameRef;
  
  const MainMenu({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/${Globals.backgroundSprite}"),
                fit: BoxFit.fill,
              ),
            ), 
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 800,
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/${Globals.labelNameSprite}"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      gameRef.startGamePlay();
                      gameRef.overlays.remove(MainMenu.id);
                      gameRef.overlays.add(Hud.id);
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/${Globals.buttonstartSprite}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: GestureDetector(
              onTap: () {
                gameRef.overlays.remove(MainMenu.id);
                gameRef.overlays.add(SettingsMenu.id);
              },
              child: Container(
                width: 500,
                height: 800,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/${Globals.iconsettingSprite}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}