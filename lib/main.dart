import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:vocab_eng_app/games/mygame.dart';
import 'package:vocab_eng_app/screens/game_play.dart';
import 'package:vocab_eng_app/screens/utils/game_over_menu.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';

import 'model/player_data.dart';
import 'model/settings.dart';
import 'screens/utils/hud.dart';
import 'screens/utils/setting_menu.dart';

MyGame _myGame = MyGame();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  await initHive();
  runApp(
    const GameRunApp(
    ),
  );
}

Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<Settings>(SettingsAdapter());
}


class GameRunApp extends StatelessWidget {
  const GameRunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vocab Eng',
      theme: ThemeData(
        fontFamily: 'Audiowide',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Settings up some default theme for elevated buttons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            fixedSize: const Size(100, 60),
          ),
        ),
      ),
      home: Scaffold(
        body: GameWidget(
          // This will dislpay a loading bar until [DinoRun] completes
          // its onLoad method.
          loadingBuilder: (conetxt) => const Center(
            child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(),
            ),
          ),
          // Register all the overlays that will be used by this game.
          overlayBuilderMap: {
            MainMenu.id: (_, MyGame gameRef) => MainMenu(gameRef: gameRef),
            // PauseMenu.id: (_, MyGame gameRef) => PauseMenu(gameRef),
            Hud.id: (_, MyGame gameRef) => Hud(gameRef),
            // GameOverMenu.id: (_, DinoRun gameRef) => GameOverMenu(gameRef),
            SettingsMenu.id: (_, MyGame gameRef) => SettingsMenu(gameRef),
          },
          // By default MainMenu overlay will be active.
          initialActiveOverlays: const [MainMenu.id],
          game: _myGame,
        ),
      ),
    );
  }
}