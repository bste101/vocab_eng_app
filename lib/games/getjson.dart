import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/games/quizgame.dart';
import 'package:vocab_eng_app/screens/utils/hud.dart';

class GetJson extends StatelessWidget {
  final String langname;
  String assettoload = '';

  GetJson({required this.langname});

  void setAsset() {
    if (langname == 'One') {
      assettoload = 'assets/json/oneword.json';
    } else if (langname == 'Two') {
      assettoload = 'assets/json/vocabtwoword.json';
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
          return QuizGame(mydata: mydata,);
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