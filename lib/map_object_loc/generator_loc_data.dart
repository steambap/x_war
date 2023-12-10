import './loc_type.dart';
import '../player_color.dart';
import '../race.dart';
import '../building/building_type.dart';

class GeneratorLocData {
  final LocType locType;
  final PlayerColor playerColor;
  final Race race;
  final List<BuildingType> buildings = [];

  GeneratorLocData({
    required this.locType,
    required this.playerColor,
    required this.race,
  });
}
