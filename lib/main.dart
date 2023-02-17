import 'package:flutter/material.dart';
import 'package:vocab_eng_app/screens/game_play.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
    debugShowCheckedModeBanner: true,
    home: GamePlay(),
    ),
  );
}
