import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/utils/select_menu.dart';
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
      body: Center(
        child: Stack(
          children: [
            // Background image container
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/${Globals.backgroundStartSprite}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    child: Container(
                      width: 800,
                      height: 700,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${Globals.labelNameSprite}"),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ],
              ),
            ),
             Positioned(
              top: 450,
              left: 100,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(SelectMenu.id);
                },
                icon: Image.asset("assets/images/${Globals.buttonstartSprite}"),
                iconSize: 200,
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(SettingsMenu.id);
                },
                icon: Image.asset("assets/images/${Globals.iconsettingSprite}"),
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
