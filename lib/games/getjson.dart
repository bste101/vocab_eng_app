import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/quiz_game.dart';


class GetJson extends StatefulWidget {
  final String langname;
  const GetJson({super.key, required this.langname});

  @override
  State<GetJson> createState() => _GetJsonState();
}

class _GetJsonState extends State<GetJson> {
  late String assettoload;

  @override
  void initState() {
    super.initState();
    setAsset();
  }
    void setAsset() {
    if (widget.langname == 'One') {
      assettoload = 'assets/json/oneword.json';
    } else if (widget.langname == 'Two') {
      assettoload = 'assets/json/twoword.json';
    } else if (widget.langname == 'Three') {
      assettoload = 'assets/json/threeword.json';
    }
  }

  Future<List<dynamic>> _loadJson() async {
    final jsonString =
        await rootBundle.loadString(assettoload, cache: false);
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }

   @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _loadJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return QuizGame(mydata: snapshot.data!);
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error loading JSON'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

