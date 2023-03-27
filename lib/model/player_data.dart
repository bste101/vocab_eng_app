import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'player_data.g.dart';

// This class stores the player progress presistently.
@HiveType(typeId: 0)
class PlayerData extends ChangeNotifier with HiveObjectMixin {
  @HiveField(1)
  int highScore = 0;

  int _lives = 3;

  int get lives => _lives;
  set lives(int value) {
    if (value <= 3 && value >= 0) {
      _lives = value;
      notifyListeners();
    }
  }

  int _currentScore = 0;

  int get currentScore => _currentScore;
  set currentScore(int value) {
    _currentScore = value;

    if (highScore < _currentScore) {
      highScore = _currentScore;
    }

    notifyListeners();
    save();
  }

  int _timer = 5;

  int get timer => _timer;
  set timer(int value) {
    if (value >= 0) {
      _timer = value;
      notifyListeners();
    }
  }
}
