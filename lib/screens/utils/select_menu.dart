import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/getjson.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';

class SelectMenu extends StatelessWidget {
  static const id = 'SelectMenu';

  const SelectMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background image container
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
                top: height * 0.1,
                left: width * 0.1,
                child: SizedBox(
                    width: width * 0.8,
                    height: height * 0.3,
                    child: Lottie.asset("assets/json/shining2-stars.json"))),
            Positioned(
              top: height * 0.16,
              left: width * 0.1,
              child: Container(
                width: width * 0.8,
                height: height * 0.15,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/${Globals.buttonLevelSprite}"),
                )),
              ),
            ),
            // Easy button
            Positioned(
              left: width * 0.25,
              bottom: height * 0.55,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    // in changelog 1 we will pass the langname name to ther other widget class
                    // this name will be used to open a particular JSON file
                    // for a particular language
                    builder: (context) => const GetJson(langname: 'One'),
                  ));
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: width * 0.5, // Adjust to fit within background dimensions
                height: height * 0.1, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "One Word",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 221, 221, 221),
                          offset: Offset(2, 3))
                    ],
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 24.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Normal button
            Positioned(
              left: width * 0.25,
              bottom: height * 0.42,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    // in changelog 1 we will pass the langname name to ther other widget class
                    // this name will be used to open a particular JSON file
                    // for a particular language
                    builder: (context) => const GetJson(langname: 'Two'),
                  ));
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: width * 0.5, // Adjust to fit within background dimensions
                height: height * 0.1, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Two Word",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 221, 221, 221),
                          offset: Offset(2, 3))
                    ],
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 24.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Hard button
            Positioned(
              left: width * 0.25,
              bottom: height * 0.29,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    // in changelog 1 we will pass the langname name to ther other widget class
                    // this name will be used to open a particular JSON file
                    // for a particular language
                    builder: (context) => const GetJson(langname: 'Three'),
                  ));
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 134, 134, 135),
                minWidth: width * 0.5, // Adjust to fit within background dimensions
                height: height * 0.1, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Three Word",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 221, 221, 221),
                          offset: Offset(2, 3))
                    ],
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 24.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            Positioned(
              left: width * 0.338,
              bottom: height * 0.1,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    // in changelog 1 we will pass the langname name to ther other widget class
                    // this name will be used to open a particular JSON file
                    // for a particular language
                    builder: (context) => const MainMenu(),
                  ));
                },
                color: Colors.white,
                splashColor: Colors.white,
                highlightColor: const Color.fromARGB(255, 91, 91, 91),
                minWidth: width * 0.3, // Adjust to fit within background dimensions
                height: height * 0.08, // Adjust to fit within background dimensions
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
      ),
    );
  }
}
