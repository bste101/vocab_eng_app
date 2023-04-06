import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/select_menu.dart';
import 'package:vocab_eng_app/screens/utils/setting_menu.dart';

class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';

  const MainMenu({
    Key? key,
  }) : super(key: key);

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
              bottom: 190,
              left: 20,
              child: SizedBox(
                  width: 350,
                  height: 250,
                  child:
                      Lottie.asset("assets/json/astronaut-illustration.json"))),
          Positioned(
            top: 150,
            left: 35,
            child: Stack(
              children: [
                Container(
                  width: 330,
                  height: 330,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/${Globals.labelNameSprite}",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 120,
            bottom: 160,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SelectMenu(),
                ));
              },
              color: Colors.yellow,
              splashColor: Colors.yellow,
              highlightColor: const Color.fromARGB(255, 233, 202, 0),
              minWidth: 160.0, // Adjust to fit within background dimensions
              height: 75.0, // Adjust to fit within background dimensions
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Text(
                "S T A R T",
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
          // setting
          Positioned(
            top: 10,
            right: 20,
            child: FloatingActionButton(
                backgroundColor: Colors.black26,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SettingMenu(),
                  ));
                },
                child: const Icon(
                  Icons.settings_rounded,
                  size: 50,
                )),
          ),
          Positioned(
              top: 100,
              left: 40,
              child: SizedBox(
                  width: 350,
                  height: 250,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
        ],
      ),
    );
  }
}
