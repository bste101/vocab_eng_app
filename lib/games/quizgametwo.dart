import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class QuizGameTwo extends StatefulWidget {
  static const id = 'QuizGameTwo';

  final MyGame gameRef;
  const QuizGameTwo({Key? key, required this.gameRef}) : super(key: key);

  @override
  State<QuizGameTwo> createState() => _QuizGameTwoState();
}

class _QuizGameTwoState extends State<QuizGameTwo> {
  late List myVocabTwoData = [];
  late final String assettoload = 'assets/json/vocabtwoword.json';
  Color colortoshow = const Color.fromARGB(255, 243, 243, 243);
  Color right = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;
  int i = 1;

  Future<List<dynamic>> loadJsonData() async {
  String jsonData =
      await DefaultAssetBundle.of(context).loadString(assettoload, 
      cache: false);
  return myVocabTwoData = json.decode(jsonData);
}

  Widget choicethreebutton(String k) {
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
        child: Text(
          myVocabTwoData[1][i.toString()][k],
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Alike",
            fontSize: 15.0,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final myVocabData = snapshot.data!;
            return Stack(
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
                      image: AssetImage(
                          "assets/images/${Globals.iconukkabartSprite}"),
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
                      image: AssetImage(
                          "assets/images/${Globals.iconrocketSprite}"),
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
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            choicethreebutton('a'),
                            choicethreebutton('b'),
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
                          children: [
                            Text(
                              myVocabTwoData[0][i.toString()], // text
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontFamily: "SecularOne-Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0),
                              //textAlign: TextAlign.center,
                            )
                          ],
                        ))),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
