import '../player_color.dart';
import '../race.dart';

class PlayerData {
  final int playerIndex;
  final PlayerColor color;
  final int team;
  final Race race;
  final bool status;
  final bool isCPU;
  final int gold;
  final int research;
  final int production;

  PlayerData({
    required this.playerIndex,
    required this.color,
    required this.team,
    required this.race,
    required this.status,
    required this.isCPU,
    required this.gold,
    required this.research,
    required this.production,
  });
}
