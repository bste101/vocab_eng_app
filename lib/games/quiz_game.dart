import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/game_over_menu.dart';
import 'package:vocab_eng_app/main.dart';

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
  bool _isEffect = AudioManagerSingleton().audioManager.isEffect;
  AudioPlayer player = AudioPlayer();
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
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool _paused = false;

  genrandomarray() {
  var distinctIds = [];
  var rand = Random();
  for (int i = 0;;) {
    distinctIds.add(rand.nextInt(100) + 1);
    random_array = distinctIds.toSet().toList();
    if (random_array.length < 100) {
      continue;
    } else {
      break;
    }
  }
}

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
          if (_isEffect == true) {
            player.play(AssetSource('audio/explosion-6055.mp3'));
          }
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
    player.stop();
    canceltimer = false;
    timer = 5;
    setState(() {
      if (j < 100) {
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

  Future<void> checkanswer(String k) async {
    if (disableAnswer == false) {
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
        score += 5;
        colortoshow = right;
        if (_isEffect == true) {
        await player.play(AssetSource('audio/interface-1-126517.mp3'));
        }
      } else {
        colortoshow = wrong;
        if (_isEffect == true) {
        await player.play(AssetSource('audio/explosion-6055.mp3'));
        }
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
            fontSize: 22.0,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final boxWidth = width * 0.75;
    final boxHeight = height * 0.2;

    final buttonWidth = width * 0.4;
    final buttonHeight = height * 0.1;
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
            top: height * 0.2,
            left: width * 0.01,
            child: Container(
              width: width ,
              height: height * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image:
                    AssetImage("assets/images/${Globals.iconukkabartSprite}"),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Positioned(
              bottom: height * 0.08,
              left: width * 0.008,
              child: SizedBox(
                  width: width ,
                  height: height * 0.45,
                  child: Lottie.asset("assets/json/rocket-launch.json"))),
          Positioned(
            //choice button
            bottom: height * 0.001,
            left: width * 0.01,
            right: width * 0,
            child: SizedBox(
              height: buttonHeight  ,
              width: buttonWidth,
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
              top: height * 0.26,
              left: width *0.12,
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
                  height: boxHeight,
                  width: boxWidth,
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
            top: height *0,
            left: width * (- 0.02),
            right: width*0,
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
                    ],
                  ),
                  Text(
                    showtimer,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: "SecularOne-Regular",
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black26,
                    onPressed: _togglePause,
                    child: Icon(
                      _paused ? Icons.play_arrow : Icons.pause,
                      size: 50,
                    ),
                  ),
                  // Pause menu
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.07,
            left: width * 0.04,
            child: Text(
              'Score : $score',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "SecularOne-Regular",
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
