import 'package:flame/components.dart';

import '../map_object_tile/tile_type.dart';

class GeneratorInfoData {
  final List<Block> landTiles = List.empty(growable: true);
  final List<Block> waterTiles = List.empty(growable: true);
  final Map<TileType, List<Block>> tileTypeMap = {};
  final List<Block> cities = List.empty(growable: true);
  final List<Block> locations = List.empty(growable: true);
}
