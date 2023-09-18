import 'package:flame/components.dart';

import './player/generator_player_data.dart';

class GameSetting {
  final int seed;
  final Block mapSize;
  final List<GeneratorPlayerData> playerSettings = List.empty(growable: true);

  GameSetting({
    required this.seed,
    required this.mapSize,
  });
}
