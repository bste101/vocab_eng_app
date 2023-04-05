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
  // ignore: no_logic_in_create_state
  State<QuizGame> createState() => _QuizGameState(mydata);
}

class _QuizGameState extends State<QuizGame> {
  List mydata;
  _QuizGameState(this.mydata);
  Color colortoshow = const Color.fromARGB(255, 243, 243, 243);
  Color right = Colors.green;
  Color wrong = Colors.red;
  bool disableAnswer = false;
  bool canceltimer = false;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var random_array;
  int i = 1;
  int j = 1;
  int timer = 5;
  int pausedTimer = 10;
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
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool _paused = false;

  void _togglePause() {
    setState(() {
      _paused = !_paused;
      if (_paused) {
        canceltimer = true;
      } else {
        timer = pausedTimer; // Start the timer from the paused value
        canceltimer = false;
        starttimer(); // Set canceltimer to false to resume the timer
      }
    });
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          life--;
          setState(() {
            if (life == 0) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => GameOverMenu(
                  score: score,
                ),
              ));
            }
          });
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
          pausedTimer = timer; // Save the current timer value
        } else {
          timer = timer - 1;
          pausedTimer = timer; // Update the pausedTimer value
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 5;
    setState(() {
      if (j < mydata[0].length) {
        i++;
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
    if (disableAnswer == false) {
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      score += 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
      life--;
      setState(() {
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
      if (k.isEmpty) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => GameOverMenu(
            score: score,
          ),
        ));
      }
    });
    Timer(const Duration(seconds: 1), nextquestion);
    } else {
      return;
    }
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
            fontWeight: FontWeight.bold,
            fontFamily: "NotoThai",
            fontSize: 24.0,
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
            //choice button
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
                      boxShadow: const [
                        BoxShadow(blurRadius: 5.0, offset: Offset(0, 5))
                      ],
                      border: Border.all(
                          color: const Color.fromARGB(255, 236, 235, 235),
                          width: 5),
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
                            fontSize: 34.0),
                        //textAlign: TextAlign.center,
                      )
                    ],
                  ))),
          // HUD widget
          Positioned(
            top: 0,
            left: -5,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: List.generate(3, (index) {
                          if (index < life) {
                            return SizedBox(
                              width: 35,
                              height: 40,
                              child: Image.asset(
                                  'assets/images/${Globals.lifeSprite}'),
                            );
                          } else {
                            return SizedBox(
                              width: 35,
                              height: 40,
                              child: Image.asset(
                                  'assets/images/${Globals.lifeLoseSprite}'),
                            );
                          }
                        }),
                      ),
                      Text(
                        'Score : $score',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "SecularOne-Regular",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$showtimer',
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: "SecularOne-Regular",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _togglePause,
                    child: Icon(_paused ? Icons.play_arrow : Icons.pause),
                  ),
                  // Pause menu
                ],
              ),
            ),
          ),
          if (_paused)
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(210, 16, 16, 16),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'PAUSED !',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Color.fromARGB(255, 136, 136, 136),
                                offset: Offset(4, 4))
                          ],
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SecularOne-Regular",
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 60,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: _togglePause,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.yellow),
                          ),
                          child: const Text(
                            'RESUME',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Color.fromARGB(255, 252, 226, 76),
                                    offset: Offset(2, 3))
                              ],
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SecularOne-Regular",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 60,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => GameOverMenu(
                                score: score,
                              ),
                            ));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text(
                            'QUIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SecularOne-Regular",
                            ),
                          ),
                        ),
                      ),
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
