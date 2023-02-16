import 'package:flame/components.dart';
//import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
//import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  SpriteComponent rocket = SpriteComponent();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    rocket
      ..sprite = await loadSprite('rocket.png')
      ..size = Vector2(100,100);
    add(rocket);
  }
}
