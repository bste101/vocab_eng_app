import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/model/player_data.dart';

class Hud extends StatelessWidget {

  static const id = 'Hud';

  final MyGame gameRef;
 
 const Hud(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.currentScore,
                  builder:(_, score, __) {
                    return Text(
                      'Score : $score',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    );
                  },
                ),
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.highScore,
                  builder: (_, highScore, __){
                    return Text(
                      'High: $highScore',
                      style: const TextStyle(
                        fontSize: 20,
                        color:  Colors.white
                      ),
                    );
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                gameRef.overlays.remove(Hud.id);
                //gameRef.overlays.add(PauseMenu.id);
                gameRef.pauseEngine();
              }, 
              child: const Icon(Icons.pause, color: Colors.white),
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.lives,
              builder: (_, lives, __){
                return Row(
                  children: List.generate(5, (index) {
                    if (index < lives) {
                      return const Icon(
                        Icons.favorite,
                        color: Colors.red
                        );
                    }else {
                      return const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      );
                    }
                  }),
                );
              },
            )
          ], 
        ),
      ), 
    );
  }
}