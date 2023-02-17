import 'package:flame/game.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_over_menu.dart';

final MyGame _myGame = MyGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _myGame,
      overlayBuilderMap: {
        GameOverMenu.ID: (BuildContext context, MyGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
      },
    );
  }
}