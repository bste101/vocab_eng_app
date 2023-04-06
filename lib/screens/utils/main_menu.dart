import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/select_menu.dart';

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 50),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SelectMenu(),
                    ));
                  },
                  icon: Image.asset(
                    "assets/images/${Globals.buttonstartSprite}",
                  ),
                  iconSize: 200,
                ),
              ],
            ),
          ),
          // setting
          Positioned(
            top: 10,
            right: 20,
            child: FloatingActionButton(
                backgroundColor: Colors.black26,
                onPressed: () {},
                child: const Icon(
                  Icons.settings_rounded,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }
}
