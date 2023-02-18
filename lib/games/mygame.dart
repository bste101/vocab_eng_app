import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
import 'package:vocab_eng_app/model/player_data.dart';
import 'package:vocab_eng_app/model/settings.dart';
import 'package:vocab_eng_app/screens/utils/game_over_menu.dart';
import 'package:vocab_eng_app/screens/utils/hud.dart';

class MyGame extends FlameGame with TapDetector, HasCollisionDetection {
  static const id = 'MyGame';

  late Settings settings;
  late PlayerData playerData;
  late Timer _timer;

  int score = 0;

  int _remainingTime = 30;

  late TextComponent _scoreText;

  late TextComponent _timerText;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    playerData = await _readPlayerData();
    settings = await _readSetting();

    add(BackgroundComponent());
    //add(RocketComponent());
    // add(UkkabartComponent());
    // add(WordComponent());
    // add(LeftChoiceComponent());
    // add(RightChoiceComponent());
    // add(PauseComponent());
    // add(GameLifeComponent(startPosition: Vector2(60, 25)));
    // add(GameLifeComponent(startPosition: Vector2(80, 25)));
    // add(GameLifeComponent(startPosition: Vector2(100, 25)));

    // add(ScoreComponent());

    // _scoreText = TextComponent(
    //   text: 'Score: $score',
    //   position: Vector2(40,50),
    //   anchor: Anchor.topRight,
    //   textRenderer: TextPaint(style: TextStyle(color: BasicPalette.white.color))
    // );

    // add(_scoreText);

    // _timerText = TextComponent(
    //   text: 'Time: $score',
    //   position: Vector2(size.x - 500, 50),
    //   anchor: Anchor.topRight,
    //   textRenderer: TextPaint(
    //     style: TextStyle(
    //       color: BasicPalette.white.color,
    //       fontSize: 50 ,
    //     ),
    //   ),
    // );

    // add(_timerText);

    // _timer.start();
  }

  void startGamePlay() {
    // _timer = Timer(
    //   1,
    //   repeat: true,
    //   onTick: (){
    //     if(_remainingTime == 0) {
    //       pauseEngine();
    //     } else {
    //       _remainingTime -= 1;
    //     }
    //   }
    // );

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

    // _scoreText = TextComponent(
    //   text: 'Score: $score',
    //   position: Vector2(40,50),
    //   anchor: Anchor.topRight,
    //   textRenderer: TextPaint(style: TextStyle(color: BasicPalette.white.color))
    // );

    // add(_scoreText);

    // _timerText = TextComponent(
    //   text: 'Time: $score',
    //   position: Vector2(size.x - 500, 50),
    //   anchor: Anchor.topRight,
    //   textRenderer: TextPaint(
    //     style: TextStyle(
    //       color: BasicPalette.white.color,
    //       fontSize: 50 ,
    //     ),
    //   ),
    // );

    // add(_timerText);

    // _timer.start();
  }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     // Update timer.
//     _timer.update(dt);

//     // Update score on the screen.
//     _scoreText.text = 'Score: $score';

//     // Update timer text to remaining seconds.
//     _timerText.text = 'Time: $_remainingTime secs';

//     // if (playerData.lives <= 0) {
//     //   overlays.add(GameOverMenu.id);
//     //   //overlays.remove(Hud.id);
//     //   pauseEngine();
//     //   //AudioManager.instance.pauseBgm();
//     // }
//   }

  Future<Settings> _readSetting() async {
    final settingsBox = await Hive.openBox<Settings>('MyGame.SettingsBox');
    final settings = settingsBox.get('MyGame.Settings');

    // If data is null, this is probably a fresh launch of the game.
    if (settings == null) {
      // In such cases store default values in hive.
      await settingsBox.put(
        'MyGame.Settings',
        Settings(bgm: true, sfx: true),
      );
    }

    // Now it is safe to return the stored value.
    return settingsBox.get('MyGame.Settings')!;
  }

  Future<PlayerData> _readPlayerData() async {
    final PlayerDataBox =
        await Hive.openBox<PlayerData>('MyGame.PlayerDataBox');
    final playerData = PlayerDataBox.get('MyGame.PlayerData');

    // If data is null, this is probably a fresh launch of the game.
    if (playerData == null) {
      // In such cases store default values in hive.
      await PlayerDataBox.put(
        'MyGame.playerData',
        PlayerData(),
      );
    }

    // Now it is safe to return the stored value.
    return PlayerDataBox.get('MyGame.playerData')!;
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // switch (state) {
    //   case AppLifecycleState.resumed:
    //     // On resume, if active overlay is not PauseMenu,
    //     // resume the engine (lets the parallax effect play).
    //     if (!(overlays.isActive(PauseMenu.id)) &&
    //         !(overlays.isActive(GameOverMenu.id))) {
    //       resumeEngine();
    //     }
    //     break;
    //   case AppLifecycleState.paused:
    //   case AppLifecycleState.detached:
    //   case AppLifecycleState.inactive:
    //     // If game is active, then remove Hud and add PauseMenu
    //     // before pausing the game.
    //     if (overlays.isActive(Hud.id)) {
    //       overlays.remove(Hud.id);
    //       overlays.add(PauseMenu.id);
    //     }
    //     pauseEngine();
    //     break;
    // }
    super.lifecycleStateChange(state);
  }
}
