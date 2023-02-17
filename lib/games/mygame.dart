import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:vocab_eng_app/components/background_component.dart';
import 'package:vocab_eng_app/components/rocket_component.dart';
import 'package:vocab_eng_app/components/ukkabart_component.dart';

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(RocketComponent());
    add(UkkabartComponent());
    // SpriteComponent _spacebg = SpriteComponent();
    // _spacebg
    //   ..sprite = await loadSprite('background/backgroundInGame.png')
    //   ..size = size;
    // add(_spacebg);
    // SpriteComponent _meteoicon = SpriteComponent();
    // _meteoicon
    //   ..sprite = await loadSprite('icon/iconUkkabart.png')
    //   ..size = Vector2(size.x,size.y)
    //   ..anchor = Anchor.center;
    // _meteoicon.x = _spacebg.x + _spacebg.width / 2;
    // _meteoicon.y = _spacebg.y -50 + _spacebg.height / 2;
    // add(_meteoicon);

    // SpriteComponent _rocketicon = SpriteComponent();
    // _rocketicon
    //   ..sprite = await loadSprite('icon/iconRocket.png')
    //   ..size = Vector2(300,400)
    //   ..anchor = Anchor.center;
    // _rocketicon.x = _spacebg.x + _spacebg.width / 2;
    // _rocketicon.y = _spacebg.y + 200 + _spacebg.height / 2;
    // add(_rocketicon);
  }
}
