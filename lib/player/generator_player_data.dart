import '../player_color.dart';
import '../race.dart';

class GeneratorPlayerData {
  final int playerIndex;
  final int team;
  final bool isCPU;
  final PlayerColor color;
  final Race race;

  GeneratorPlayerData({
    required this.playerIndex,
    required this.team,
    required this.isCPU,
    required this.color,
    required this.race,
  });
}
