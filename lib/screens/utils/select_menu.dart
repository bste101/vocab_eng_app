/* 
====================================================================================================================
didn't finished Normal and Hard Mode
====================================================================================================================
*/

import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/getjson.dart';
import 'package:vocab_eng_app/games/mygame.dart';

class SelectMenu extends StatelessWidget {
  static const id = 'SelectMenu';

  const SelectMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              bottom: 600,
              left: 100,
              child: Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/${Globals.buttonLevelSprite}"),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            // Easy button
            Positioned(
              left: 110,
              bottom: 450,
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
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 60.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "One Word",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 22.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Normal button
            Positioned(
              left: 110,
              bottom: 350,
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
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 60.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Two Word",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SecularOne-Regular",
                    fontSize: 22.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // Hard button
            Positioned(
              left: 110,
              bottom: 250,
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
                minWidth: 180.0, // Adjust to fit within background dimensions
                height: 60.0, // Adjust to fit within background dimensions
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Three Word",
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
      ),
    );
  }
}
