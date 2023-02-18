import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_play.dart';
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
      body: Container(
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
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/${Globals.labelNameGame}"),
                fit: BoxFit.fill),
                ),
                
              ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  gameRef.startGamePlay();
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(Hud.id);
                },
                child: Container(
                  width: 200,
                  height: 1000,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.buttonstartSprite}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(SettingsMenu.id);
                },
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.iconukkabartSprite}"),
                      fit: BoxFit.contain,
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