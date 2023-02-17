import 'package:flame/components.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class LChoiceComponent extends SpriteComponent with HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iconlchoiceSprite);
    size = gameRef.size;
  }
}
