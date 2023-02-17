import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_play.dart';
import 'package:vocab_eng_app/screens/main_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GamePlay(),
    ),
  );
}
