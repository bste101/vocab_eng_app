import 'package:flame/game.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/utils/game_over_menu.dart';

final MyGame _myGame = MyGame();

class GamePlay extends StatelessWidget {

  static const id = 'GamePlay';
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _myGame,
      overlayBuilderMap: {
        GameOverMenu.id: (BuildContext context, MyGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
      },
    );
  }
}