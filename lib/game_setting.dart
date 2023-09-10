import 'dart:math';

class GameSetting {
  final int seed;
  final Point<int> mapSize;

  GameSetting({
    required this.seed,
    required this.mapSize,
  });
}
