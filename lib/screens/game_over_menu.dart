import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final MyGame gameRef;
  const GameOverMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}