import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/components/background_component.dart';
import 'package:vocab_eng_app/components/leftchoice_component.dart';
import 'package:vocab_eng_app/components/rightchoice_component.dart';
import 'package:vocab_eng_app/components/rocket_component.dart';
import 'package:vocab_eng_app/components/ukkabart_component.dart';
import 'package:vocab_eng_app/components/mainword_component.dart';
import 'package:vocab_eng_app/components/pause_component.dart';
import 'package:vocab_eng_app/components/gamelife_component.dart';
import 'package:vocab_eng_app/components/score_component.dart';
import 'package:vocab_eng_app/constant/globals.dart';

class MyGame extends FlameGame {
  int score = 0;

  late Timer _timer;

  int _remainingTime = 30;

  late TextComponent _scoreText;

  late TextComponent _timerText;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _timer = Timer(
      1, 
      repeat: true,
      onTick: (){
        if(_remainingTime == 0) {
          pauseEngine();
        } else {
          _remainingTime -= 1;
        }
      }
    );

    add(BackgroundComponent());
    add(RocketComponent());
    add(UkkabartComponent());
    add(WordComponent());
    add(LeftChoiceComponent());
    add(RightChoiceComponent());
    add(PauseComponent());
    add(GameLifeComponent(startPosition: Vector2(60, 25)));
    add(GameLifeComponent(startPosition: Vector2(80, 25)));
    add(GameLifeComponent(startPosition: Vector2(100, 25)));

    add(ScoreComponent());

    _scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(40,50),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(style: TextStyle(color: BasicPalette.white.color))
    );
    
    add(_scoreText);
     
    _timerText = TextComponent(
      text: 'Time: $score',
      position: Vector2(size.x - 500, 50),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 50 ,
        ),
      ),
    );

    add(_timerText);

    _timer.start();
    
  }
 
  @override
  void update(double dt) {
    super.update(dt);

    // Update timer.
    _timer.update(dt);

    // Update score on the screen.
    _scoreText.text = 'Score: $score';

    // Update timer text to remaining seconds.
    _timerText.text = 'Time: $_remainingTime secs';
  }

}
