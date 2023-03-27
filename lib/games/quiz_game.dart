import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/game_over_menu.dart';

class QuizGame extends StatefulWidget {
  static const id = 'QuizGame';

  final List mydata;
  const QuizGame({Key? key, required this.mydata}) : super(key: key);

  @override
  State<QuizGame> createState() => _QuizGameState(mydata);
}

class _QuizGameState extends State<QuizGame> {
  final List mydata;
  _QuizGameState(this.mydata);
  Color colortoshow = const Color.fromARGB(255, 243, 243, 243);
  Color right = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;
  bool canceltimer = false;
  var random_array;
  int i = 1;
  int j = 1;
  int timer = 5;
  String showtimer = "5";
  int score = 0;
  int life = 3;
  Map<String, Color> btncolor = {
    "a": Colors.white,
    "b": Colors.white,
  };

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  genrandomarray() {
    var distinctIds = [];
    var rand = Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 2);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          checkanswer("");
        } else if (canceltimer == true) {
          t.cancel();
          nextquestion();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 5;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => GameOverMenu(
            score: score,
          ),
        ));
      }
      btncolor["a"] = Colors.white;
      btncolor["b"] = Colors.white;
      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      score += 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
      setState(() {
        life--;
        if (life == 0) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GameOverMenu(
              score: score,
            ),
          ));
        }
      });
    }
    setState(() {
      if (k.isNotEmpty) {
        btncolor[k] = colortoshow;
      }
      canceltimer = true;
      disableAnswer = true;
      if( k.isEmpty) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GameOverMenu(
              score: score,
            ),
          ));
      }
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget hud() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Score : $score',
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            'Timer : $showtimer',
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          Row(
            children: List.generate(3, (index) {
              if (index < life) {
                return SizedBox(
                  width: 30,
                  height: 40,
                  child: Image.asset('assets/images/${Globals.lifeSprite}'),
                );
              } else {
                return SizedBox(
                  width: 30,
                  height: 40,
                  child: Image.asset('assets/images/${Globals.lifeLoseSprite}'),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        color: btncolor[k],
        splashColor: Colors.white,
        highlightColor: const Color.fromARGB(255, 134, 134, 135),
        minWidth: 150.0, // Adjust to fit within background dimensions
        height: 100.0, // Adjust to fit within background dimensions
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          //$_threadException.stackTrace
          mydata[1][i.toString()][k],
          style: const TextStyle(
            color: Colors.black,
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
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.iconrocketSprite}"),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Positioned(
            bottom: 0,
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
                    children: [
                      Text(
                        mydata[0][i.toString()], // text
                        style: const TextStyle(
                            color: Colors.black38,
                            fontFamily: "SecularOne-Regular",
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                        //textAlign: TextAlign.center,
                      )
                    ],
                  ))),
          // HUD widget
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score : $score',
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    'Timer : $showtimer',
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Row(
                    children: List.generate(3, (index) {
                      if (index < life) {
                        return SizedBox(
                          width: 30,
                          height: 40,
                          child: Image.asset(
                              'assets/images/${Globals.lifeSprite}'),
                        );
                      } else {
                        return SizedBox(
                          width: 30,
                          height: 40,
                          child: Image.asset(
                              'assets/images/${Globals.lifeLoseSprite}'),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
