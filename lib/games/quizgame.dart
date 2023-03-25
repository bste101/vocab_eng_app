import 'dart:convert';
import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class QuizGame extends StatefulWidget {
  static const id = 'QuizGame';

  final MyGame gameRef;
  final List myVocabData;
  const QuizGame({
    Key? key,
    required this.gameRef,
    required this.myVocabData,
  }) : super(key: key);

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  Color colortoshow = const Color.fromARGB(255, 243, 243, 243);
  Color right = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;

  Widget choicebutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0,
      ),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.white,
        splashColor: Colors.white,
        highlightColor: const Color.fromARGB(255, 134, 134, 135),
        minWidth: 150.0, // Adjust to fit within background dimensions
        height: 100.0, // Adjust to fit within background dimensions
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: const Text(
          'mydata[1]',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Alike",
            fontSize: 15.0,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  // Widget mainWord() {
  //   return Scaffold(
  //     body: Column(children: [
  //       Container(
  //           decoration: BoxDecoration(
  //               color: Colors.grey, borderRadius: BorderRadius.circular(10)),
  //           height: 120,
  //           child: const Text(
  //             "Hello Space",
  //             style: TextStyle(
  //                 color: Colors.black, fontFamily: "Alike", fontSize: 22.0),
  //           ))
  //     ]),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image container
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/${Globals.backgroundSprite}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 70,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image:
                    AssetImage("assets/images/${Globals.iconukkabartSprite}"),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 95,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.iconrocketSprite}"),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 10,
            right: 0,
            child: SizedBox(
              height: 100,
              width: 50,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                    ],
                  )),
            ),
          ),
          Positioned(
              // box word
              top: 280,
              left: 65,
              child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  width: 270,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Hello this is mi", // text
                        style: TextStyle(
                            color: Colors.black38,
                            fontFamily: "SecularOne-Regular",
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                        //textAlign: TextAlign.center,
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}

class GetJson extends StatelessWidget {
  String langname;
  MyGame gameRef;
  String assettoload;
  GetJson({
    super.key,
    required this.langname,
    required this.assettoload,
    required this.gameRef,
  });

  setasset() {
    if (langname == "One") {
      assettoload = "assets/json/${Globals.onewordjson}";
    } else if (langname == "Two") {
      assettoload = "assets/json/${Globals.twowordjson}";
    } else if (langname == "Three") {
      assettoload = "assets/json/${Globals.threewordjson}";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString(assettoload, cache: false),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List myVocabData = json.decode(snapshot.data.toString());
          if (myVocabData == []) {
            return const Scaffold(
              body: Center(
                child: Text(
                  "Loading",
                ),
              ),
            );
          } else {
            return QuizGame(
              gameRef: gameRef,
              myVocabData: myVocabData,
            );
          }
        });
  }
}
