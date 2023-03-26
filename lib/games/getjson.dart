import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/QuizGame.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/utils/hud.dart';

class GetJson extends StatelessWidget {
  final String langname;
  final MyGame gameRef;
  String assettoload = '';

  GetJson({required this.langname, required this.gameRef});

  void setAsset() {
    if (langname == 'One') {
      assettoload = 'assets/json/oneword.json';
    } else if (langname == 'Two') {
      assettoload = 'assets/json/twoword.json';
    } else if (langname == 'Three') {
      assettoload = 'assets/json/threeword.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    setAsset();
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List mydata = json.decode(snapshot.data.toString());
          return QuizGame(gameRef: gameRef);
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Loading'),
            ),
          );
        }
      },
    );
  }
}