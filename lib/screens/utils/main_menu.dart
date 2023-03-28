import 'package:flutter/material.dart';
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 210,
                  height: 230,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/${Globals.labelNameSprite}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                IconButton(
                  padding: EdgeInsets.zero,
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
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Image.asset(
                "assets/images/${Globals.iconsettingSprite}",
              ),
              iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
