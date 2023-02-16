import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(game: MyGame(),),
  );
}
class MyGame extends FlameGame with HasTappableComponents {
}

class Space extends SpriteComponent with HasGameRef {
      @override
      Future<void> onLoad() async {
        super.onLoad();
        sprite = await gameRef.loadSprite('background.png');
        size = sprite!.originalSize;
      }
    }