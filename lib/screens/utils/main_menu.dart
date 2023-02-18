import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_play.dart';
import 'package:vocab_eng_app/screens/utils/setting_menu.dart';

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
          fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 120),
                child: Text(
                  'Eng Vocab',
                    style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width:  200,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.startGamePlay();
                    gameRef.overlays.remove(MainMenu.id);
                    //gameRef.overlays.add(Hud.id);
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width:  200,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(MainMenu.id);
                    gameRef.overlays.add(SettingsMenu.id);
                    //gameRef.overlays.add(Hud.id);
                },
                child: const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      )
    );
      
  }
}
