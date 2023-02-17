import 'package:flame/components.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class UkkabartComponent extends SpriteComponent with HasGameRef<MyGame> {
  //final double _spriteHeight = 200;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iconukkabartSprite);
    size = gameRef.size;
  }
}
