import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  final MyGame gameRef;
  
  const MainMenu({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${Globals.backgroundSprite}"),
          fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Eng Vocab',
                  style: TextStyle(
                    fontSize: 100,
                  ),
                ),
              ),
              SizedBox(
                width:  400,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay()
                        ),
                    );
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      )
    );
      
  }
}
