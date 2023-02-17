import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/mygame.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameWidget(game: MyGame()));
}
