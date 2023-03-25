import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocab_eng_app/games/QuizGame.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class GetJson extends StatelessWidget {
  String langname;
  GetJson({super.key, 
    required this.langname,
    required this.assettoload,
    required this.gameRef,
  });
  MyGame gameRef;
  String assettoload;

  setasset() {
    if (langname == 'One') {
      assettoload = 'assets/json/oneword.json';
    } else if (langname == 'Two') {
      assettoload = 'assets/json/twoword.json';
    } else if (langname == 'Three') {
      assettoload = 'assets/json/threeword.json';
    }
  }

   Future<List<dynamic>> _loadJson(BuildContext context) async {
    final jsonString = await rootBundle.loadString(assettoload);
    final data = json.decode(jsonString);
    return data as List<dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder<List<dynamic>>(
      future: _loadJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text('Loading'),
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
        return QuizGame(
          gameRef: gameRef,
          myVocabData: snapshot.data!,
        );
      },
    );
  }
}