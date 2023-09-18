import 'package:flame/components.dart';
import '../map_object_tile/tile_data.dart';
import '../map_object_loc/generator_loc_data.dart';

class GeneratorCellData {
  late TileData tile;
  GeneratorLocData? loc;
  late int tileDangerLevel;
  late bool isAround;
  late Block? parentTile;
}
