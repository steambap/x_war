import 'dart:math';

import 'package:x_war/map_object_loc/loc_game_info.dart';
import 'package:x_war/map_object_loc/loc_sprite.dart';

import './map_cell.dart';
import './map_component.dart';
import '../map_object_loc/generator_loc_data.dart';
import '../game_setting.dart';
import '../map_object_tile/tile_data.dart';
import '../map_object_tile/tile_sprite.dart';
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
        final cellData = mapData[i][j];
        initTiles(Point(i, j), cellData.tile);
        if (cellData.loc != null) {
          _initCity(Point(i, j), cellData.loc!);
        }
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

  void _initCity(Point<int> pos, GeneratorLocData locData) {
    final cell = cells[pos.x][pos.y];
    final locInfo = LocGameInfo(locType: locData.locType);
    final sprite = LocSprite(info: locInfo, position: cell.renderPos);
    cell.loc = sprite;
    mapComponent.add(sprite);
  }
}
