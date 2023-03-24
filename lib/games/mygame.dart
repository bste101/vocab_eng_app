import 'package:flame/game.dart';
import 'package:hive/hive.dart';
import 'package:vocab_eng_app/components/background_component.dart';
import 'package:vocab_eng_app/model/player_data.dart';
import 'package:vocab_eng_app/model/settings.dart';

class MyGame extends FlameGame{
  static const id = 'MyGame';

  late Settings settings;
  late PlayerData playerData;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    playerData = await _readPlayerData();
    settings = await _readSetting();

    add(BackgroundComponent());
  }

  Future<Settings> _readSetting() async {
    final settingsBox = await Hive.openBox<Settings>('MyGame.SettingsBox');
    final settings = settingsBox.get('MyGame.Settings');

    if (settings == null) {
      await settingsBox.put(
        'MyGame.Settings',
        Settings(bgm: true, sfx: true),
      );
    }
    return settingsBox.get('MyGame.Settings')!;
  }

  Future<PlayerData> _readPlayerData() async {
    final PlayerDataBox =
        await Hive.openBox<PlayerData>('MyGame.PlayerDataBox');
    final playerData = PlayerDataBox.get('MyGame.PlayerData');

    if (playerData == null) {
      await PlayerDataBox.put(
        'MyGame.playerData',
        PlayerData(),
      );
    }

    return PlayerDataBox.get('MyGame.playerData')!;
  }
}
