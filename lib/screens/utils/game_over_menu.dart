import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';
import 'package:vocab_eng_app/screens/utils/select_menu.dart';
import 'package:vocab_eng_app/main.dart';

class GameOverMenu extends StatefulWidget {
  final int score;
  const GameOverMenu({super.key, required this.score});

  @override
  // ignore: no_logic_in_create_state
  State<GameOverMenu> createState() => _GameOverMenuState(score);
}

class _GameOverMenuState extends State<GameOverMenu> {
  int score;
  _GameOverMenuState(this.score);
  bool _isPlaying = AudioManagerSingleton().audioManager.isPlaying;
  AudioPlayer player = AudioPlayer();

  Future<void> playOver() async {
    if (_isPlaying == true) {
      await player.play(AssetSource('audio/failure-1-89170.mp3'));
    }
  }

  @override
  Widget build(BuildContext context) {
    playOver();

    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final boxWidth = width * 1;
    final boxHeight = height * 0.8;

    final lottieWidth = width * 0.8;
    final lottieHeight = height * 0.4;

    final buttonWidth = width * 0.4;
    final buttonHeight = height * 0.1;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/${Globals.backgroundStartSprite}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.08,
            left: width * 0.008,
            child: Container(
              width: boxWidth,
              height: boxHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/${Globals.boxgameOver}"),
                fit: BoxFit.fill,
              )),
            ),
          ),

          Positioned(
              top: height * 0.08,
              left: width * 0.01,
              child: SizedBox(
                  width: lottieWidth,
                  height: lottieHeight,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
          Positioned(
            top: height * 0.5,
            left: width * 0.16,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your score is : $score',
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 232, 230, 230),
                            offset: Offset(2, 3))
                      ],
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "SecularOne-Regular",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.55,
            bottom: height * 0.25,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SelectMenu(),
                ));
              },
              color: Colors.yellow,
              splashColor: Colors.yellow,
              highlightColor: const Color.fromARGB(255, 233, 202, 0),
              minWidth: buttonWidth, // Adjust to fit within background dimensions
              height: buttonHeight, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "Play Again",
                style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 246, 209, 24),
                        offset: Offset(2, 3))
                  ],
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "SecularOne-Regular",
                  fontSize: 24.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Positioned(
            left: width * 0.07,
            bottom: height * 0.25,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainMenu(),
                ));
              },
              color: Colors.white,
              splashColor: Colors.white,
              highlightColor: const Color.fromARGB(255, 91, 91, 91),
              minWidth: buttonWidth, // Adjust to fit within background dimensions
              height: buttonHeight, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "HOME",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "SecularOne-Regular",
                  fontSize: 22.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
