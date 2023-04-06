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
              top: 50,
              left: 40,
              child: SizedBox(
                  width: 350,
                  height: 250,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
          Positioned(
            top: 80,
            left: 90,
            child: Container(
              width: 220,
              height: 220,
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
            left: 50,
            top: 300,
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
              height: 80,
              width: 300,
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
            left: 50,
            top: 420,
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
              height: 80,
              width: 300,
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
                    onChanged: (value) {},
                    value: true,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 125,
            bottom: 90,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainMenu(),
                ));
              },
              color: Colors.white,
              splashColor: Colors.white,
              highlightColor: const Color.fromARGB(255, 91, 91, 91),
              minWidth: 150.0, // Adjust to fit within background dimensions
              height: 60.0, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "Back",
                style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 221, 221, 221),
                        offset: Offset(2, 3))
                  ],
                  color: Colors.black,
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
