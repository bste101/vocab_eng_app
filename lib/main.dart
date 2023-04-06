import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';

class AudioManager {
  final AudioPlayer _player = AudioPlayer();
  late bool _isPlaying;
  late bool _isEffect ;

  void play() async {
    await _player.play(AssetSource('audio/Space-Jazz.mp3'));
    _player.setReleaseMode(ReleaseMode.loop);
    _isPlaying = true;
  }
  void playEffect() {
    _isEffect = true;
  }

  void stopEffect() {
    _isEffect = false;
  }
  void stop() async {
    await _player.pause();
    _isPlaying = false;
  }

  void toggle() {
    if (_isPlaying == false) {
      stop();
      _isPlaying = false;
    } else {
      play();
      _isPlaying = true;
    }
  }

  
  bool get isEffect => _isEffect;
  bool get isPlaying => _isPlaying;
}

class AudioManagerSingleton {
  static final AudioManagerSingleton _instance =
      AudioManagerSingleton._internal();
  final AudioManager audioManager = AudioManager();

  factory AudioManagerSingleton() {
    return _instance;
  }

  AudioManagerSingleton._internal();
}

void main() {
  // Make the app full screen
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  AudioManagerSingleton().audioManager.play();
  AudioManagerSingleton().audioManager.playEffect();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vocab for The World",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainMenu(),
    );
  }
}
