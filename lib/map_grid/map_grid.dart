import 'package:flame/components.dart';

import '../map_object_loc/loc_game_info.dart';
import '../map_object_loc/loc_sprite.dart';
import './facing.dart';
import './map_cell.dart';
import './map_component.dart';
import '../map_object_loc/generator_loc_data.dart';
import '../game_setting.dart';
import '../map_object_tile/tile_data.dart';
import '../map_object_tile/tile_sprite.dart';
import '../map_generator/map_generator.dart';
import '../map_helper.dart' show pixelToPos;

class MapGrid {
  late List<List<MapCell>> cells;
  late final MapComponent mapComponent;
  late MapGenerator generator;
  final settings = GameSetting(seed: 0, mapSize: const Block(27, 27));

  MapGrid() {
    mapComponent = MapComponent();
  }

  void createMap() {
    generator = MapGenerator(settings);

    final mapData = generator.generateRandom();

    cells = List.generate(settings.mapSize.x,
        (i) => List.generate(settings.mapSize.y, (j) => MapCell(Block(i, j))));

    for (int i = 0; i < settings.mapSize.x; i++) {
      for (int j = 0; j < settings.mapSize.y; j++) {
        final cellData = mapData[i][j];
        initTiles(Block(i, j), cellData.tile);
        if (cellData.loc != null) {
          _initCity(Block(i, j), cellData.loc!);
        }
      }
    }
  }

  void initTiles(Block block, TileData tile) {
    final cell = cells[block.x][block.y];
    final TileSprite sprite =
        TileSprite(block: block, tileData: tile, position: cell.renderPos);
    cell.tile = sprite;
    mapComponent.add(sprite);
  }

  void _initCity(Block block, GeneratorLocData locData) {
    final cell = cells[block.x][block.y];
    final locInfo = LocGameInfo(locType: locData.locType);
    final sprite = LocSprite(info: locInfo, position: cell.renderPos);
    cell.loc = sprite;
    mapComponent.add(sprite);
  }

  Facing getFacing(Block their, Block mine) {
    final theirPos = cells[their.x][their.y].renderPos;
    final minePos = cells[mine.x][mine.y].renderPos;
    if (theirPos.x < minePos.x) {
      return Facing.left;
    }

    return Facing.right;
  }

  Block getMapCenter() {
    return Block(settings.mapSize.x ~/ 2, settings.mapSize.y ~/ 2);
  }

  Block? getPos(Vector2 position) {
    final block = pixelToPos(position);

    if (isInMap(block)) {
      return block;
    }

    return null;
  }

  bool isInMap(Block block) {
    if (block.x >= 0 &&
        block.x < settings.mapSize.x &&
        block.y >= 0 &&
        block.y < settings.mapSize.y) {
      return true;
    }

    return false;
  }
}
