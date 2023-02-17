import 'package:flame/components.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class GameLifeComponent extends SpriteComponent with HasGameRef<MyGame> {
  final double _spriteHeight = 200;
  final Vector2 startPosition;

  GameLifeComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.icongamelifeSprite);
    position = startPosition;
    widht = height = _spriteHeight;
    anchor = Anchor.center;
  }
}
