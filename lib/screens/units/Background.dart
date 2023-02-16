import 'package:flame/components.dart';
import 'package:vocab_eng_app/screens/BaseWidget.dart';

class Background extends BaseWidget {
  SpriteComponent _bgSprite;

  Background(String src) {
    _bgSprite = SpriteComponent.fromImage(image);
  }
  @override
  void render(Canvas canvas) {
    _bgSprite.render(canvas);
  }

  @override
  void resize(Size size) {
    _bgSprite.width = size.width;
    _bgSprite.height = size.height;
  }

  @override
  void update() {}
}
