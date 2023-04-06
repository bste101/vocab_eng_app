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
              bottom: height * 0.25,
              left: width * 0.05,
              child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.3,
                  child:
                      Lottie.asset("assets/json/astronaut-illustration.json"))),
          Positioned(
            top: height * 0.13,
            left: width * 0.1,
            child: Stack(
              children: [
                Container(
                  width: width * 0.8,
                  height: width * 1.0,
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
            left: width * 0.3,
            bottom: height * 0.2,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SelectMenu(),
                ));
              },
              color: Colors.yellow,
              splashColor: Colors.yellow,
              highlightColor: const Color.fromARGB(255, 233, 202, 0),
              minWidth: width * 0.4,
              height: height * 0.1,
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
            top: height * 0.02,
            right: width * 0.05,
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
              top: height * 0.09,
              left: width * 0.1,
              child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.3,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
        ],
      ),
    );
  }
}
