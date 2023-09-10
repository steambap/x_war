import 'dart:math';

import '../game_setting.dart';
import '../map_object_tile/tile_data.dart';
import '../map_object_tile/tile_sprite.dart';
import './map_cell.dart';
import './map_component.dart';
import '../map_generator/map_generator.dart';

class MapGrid {
  late List<List<MapCell>> cells;
  late final MapComponent mapComponent;
  late MapGenerator generator;

  MapGrid() {
    mapComponent = MapComponent();
  }

  void createMap() {
    final settings = GameSetting(seed: 0, mapSize: const Point(27, 27));
    generator = MapGenerator(settings);

    final mapData = generator.generateRandom();

    cells = List.generate(settings.mapSize.x,
        (i) => List.generate(settings.mapSize.y, (j) => MapCell(Point(i, j))));

    for (int i = 0; i < settings.mapSize.x; i++) {
      for (int j = 0; j < settings.mapSize.y; j++) {
        initTiles(Point(i, j), mapData[i][j].tile);
      }
    }
  }

  void initTiles(Point<int> pos, TileData tile) {
    final cell = cells[pos.x][pos.y];
    final TileSprite sprite =
        TileSprite(pos: pos, tileData: tile, position: cell.renderPos);
    cell.tile = sprite;
    mapComponent.add(sprite);
  }
}
