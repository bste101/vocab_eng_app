import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/model/player_data.dart';
import 'package:vocab_eng_app/screens/utils/pause_menu.dart';
import '../../constant/globals.dart';

class Hud extends StatelessWidget {
  static const id = 'Hud';

  final MyGame gameRef;

  const Hud(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.currentScore,
                  builder: (_, score, __) {
                    return Text(
                      'Score : $score',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    );
                  },
                ),
                /* 
                 Testtttttttttttttttttt
                */
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.highScore,
                  builder: (_, highScore, __) {
                    return Text(
                      ' High  : $highScore',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    );
                  },
                ),
              ],
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.lives,
              builder: (_, lives, __) {
                return Row(
                  children: List.generate(3, (index) {
                    if (index < lives) {
                      return SizedBox(
                        width: 30,
                        height: 40,
                        child: Image.asset(
                            'assets/images/${Globals.lifeSprite}'),
                      );
                    } else {
                      return SizedBox(
                        width: 30,
                        height: 40,
                        child: Image.asset(
                            'assets/images/${Globals.lifeLoseSprite}'),
                      );
                    }
                  }),
                );
              },
            ),
            TextButton(
              onPressed: () {
                gameRef.overlays.remove(Hud.id);
                gameRef.overlays.add(PauseMenu.id);
                gameRef.pauseEngine();
              },
              child: const Icon(
                Icons.pause,
                color: Colors.white,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
