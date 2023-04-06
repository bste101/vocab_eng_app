import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'main_menu.dart';

class SettingMenu extends StatelessWidget {
  static const id = 'SettingMenu';

  const SettingMenu({
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
            top: 50,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
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
              top: 50,
              left: 40,
              child: SizedBox(
                  width: 350,
                  height: 250,
                  child: Lottie.asset("assets/json/shining2-stars.json"))),
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
