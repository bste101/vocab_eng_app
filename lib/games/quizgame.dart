import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class QuizGame extends StatefulWidget {
  static const id = 'QuizGame';

  final MyGame gameRef;

  const QuizGame({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;

  Widget choicebutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.white,
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 50.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: const Text(
          'mydata[1][i.toString()][k]',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

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
            left: 60,
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
              height: 230,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.iconrocketSprite}"),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 80,
              width: 1,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
