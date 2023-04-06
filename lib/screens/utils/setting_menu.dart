import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/main.dart';
import 'main_menu.dart';

class SettingMenu extends StatefulWidget {
  static const id = 'SettingMenu';
  const SettingMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  bool _isPlaying = AudioManagerSingleton().audioManager.isPlaying;
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _isPlaying = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AudioManager audioManager = AudioManagerSingleton().audioManager;
    if (!audioManager.isPlaying) {
      _isPlaying = false;
    }
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  void _toggleMusic() {
    AudioManager audioManager = AudioManagerSingleton().audioManager;
    if (_isPlaying) {
      audioManager.stop();
      setState(() {
        _isPlaying = false;
      });
    } else {
      audioManager.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
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
              top: height * (-0.08),
              left: width * 0.2,
              child: SizedBox(
                  width: width * 0.6,
                  height: height* 0.6,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
          Positioned(
            top: height * (-0.25),
            left: width * 0.25,
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/${Globals.labelSetting}",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.15,
            top: height * 0.35,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 5.0, offset: Offset(0, 5))
                  ],
                  border: Border.all(
                      color: const Color.fromARGB(255, 236, 235, 235),
                      width: 5),
                  borderRadius: BorderRadius.circular(10)),
              height: height * 0.1,
              width: width *0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Music',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 221, 221, 221),
                            offset: Offset(2, 3))
                      ],
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontFamily: 'SecularOne-Regular',
                      fontSize: 37.0,
                    ),
                  ),
                  Switch(
                    value: _isPlaying,
                    onChanged: (value) {
                      _toggleMusic();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.15,
            top: height * 0.5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 5.0, offset: Offset(0, 5))
                  ],
                  border: Border.all(
                      color: const Color.fromARGB(255, 236, 235, 235),
                      width: 5),
                  borderRadius: BorderRadius.circular(10)),
              height: height * 0.1,
              width: width *0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Effect',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 221, 221, 221),
                            offset: Offset(2, 3))
                      ],
                      color: Color.fromARGB(255, 65, 64, 64),
                      fontFamily: 'SecularOne-Regular',
                      fontSize: 37.0,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: width *0.35,
            bottom: height * 0.05,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainMenu(),
                ));
              },
              color: const Color.fromARGB(255, 255, 252, 252),
              splashColor: const Color.fromARGB(255, 255, 254, 254),
              highlightColor: const Color.fromARGB(255, 255, 255, 255),
              minWidth: width *0.25, // Adjust to fit within background dimensions
              height: height *0.08, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "Back",
                style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(2, 3))
                  ],
                  color: Color.fromARGB(255, 4, 4, 4),
                  fontFamily: "SecularOne-Regular",
                  fontSize: 20.0,
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
