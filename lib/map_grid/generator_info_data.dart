import 'dart:math';

import '../map_object_tile/tile_type.dart';

class GeneratorInfoData {
  final List<Point<int>> landTiles = List.empty(growable: true);
  final List<Point<int>> waterTiles = List.empty(growable: true);
  final Map<TileType, List<Point<int>>> tileTypeMap = {};
  final List<Point<int>> cities = List.empty(growable: true);
  final List<Point<int>> locations = List.empty(growable: true);
}
