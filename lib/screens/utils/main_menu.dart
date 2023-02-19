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
                    image: AssetImage("assets/images/${Globals.backgroundSprite}"),
                    fit: BoxFit.cover,
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
              left: 0,
              bottom: 200,
              child: GestureDetector(
                onTap: () {
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(SelectMenu.id);
                },
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.buttonstartSprite}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 30,
              child: GestureDetector(
                onTap: () {
                  gameRef.overlays.remove(MainMenu.id);
                  gameRef.overlays.add(SettingsMenu.id);
                },
                child: Container(
                  width: 400,
                  height: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${Globals.iconsettingSprite}"),
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
