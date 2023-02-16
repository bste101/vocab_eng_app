import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    print('loading assets');
    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('home_background.png')
      ..size = size;
    add(background);
  }
}
