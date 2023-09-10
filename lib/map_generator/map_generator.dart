import 'dart:math';

import '../game_setting.dart';
import './tile_generator.dart';
import '../map_grid/generator_cell_data.dart';
import '../map_object_tile/tile_data.dart';

class MapGenerator {
  late final Random rand;
  final GameSetting gameSetting;
  late final TileGenerator tileGenerator;
  late final List<List<GeneratorCellData>> mapData;

  MapGenerator(this.gameSetting) {
    rand = Random(gameSetting.seed);
    tileGenerator = TileGenerator(mapGen: this);
  }

  List<List<GeneratorCellData>> generateRandom() {
    mapData = _fillStage();
    tileGenerator.createStage();

    return mapData;
  }

  List<List<GeneratorCellData>> _fillStage() {
    final size = gameSetting.mapSize;
    final List<List<GeneratorCellData>> data = List.empty(growable: true);

    for (int i = 0; i < size.x; i++) {
      List<GeneratorCellData> cellList = List.empty(growable: true);
      for (int j = 0; j < size.y; j++) {
        final tile = TileData();
        tile.tileType = tileGenerator.getRandomTileType(Point(i, j));
        tile.index = 1;
        final GeneratorCellData cell = GeneratorCellData();
        cell.tile = tile;
        cellList.add(cell);
      }

      data.add(cellList);
    }

    return data;
  }
}
