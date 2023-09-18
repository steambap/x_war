import 'package:flame/components.dart';

import './map_generator.dart';
import '../map_object_tile/tile_type.dart';
import '../map_helper.dart' show getNeighbour;

class TileGenerator {
  static List<List<double>> waterWeightTable = [
    [0.07, 30],
    [0.21, 35],
    [0.35, 50],
    [0.42, 55],
    [1, 100],
  ];

  final MapGenerator mapGen;

  TileGenerator({required this.mapGen});

  void createStage() {
    const max = 5;

    for (int i = 0; i < 5; i++) {
      balanceMapTile(i, max);
    }
    for (int j = 0; j < mapGen.gameSetting.mapSize.x; j++) {
      for (int k = 0; k < mapGen.gameSetting.mapSize.y; k++) {
        final tileType = mapGen.mapData[j][k].tile.tileType;
        final block = Block(j, k);

        if (tileType == TileType.waterShallow) {
          mapGen.info.waterTiles.add(block);
        } else {
          mapGen.info.landTiles.add(block);
        }
      }
    }
  }

  void balanceMapTile(turn, max) {
    final Block mapSize = mapGen.gameSetting.mapSize;

    for (int i = 0; i < mapSize.x; i++) {
      for (int j = 0; j < mapSize.y; j++) {
        final ns = getNeighbour(Block(i, j), mapSize);
        final cell = mapGen.mapData[i][j];

        int numOfWater = 0;
        for (var element in ns) {
          final nCell = mapGen.mapData[element.x][element.y];
          if (nCell.tile.tileType == TileType.waterShallow) {
            numOfWater += 1;
          }
        }

        numOfWater += 6 - ns.length;
        if (turn <= max) {
          if (cell.tile.tileType == TileType.waterShallow) {
            if (numOfWater < 3) {
              mapGen.mapData[i][j].tile.tileType = TileType.plain;
            }
          }
        }
      }
    }
  }

  int getTileWeight(Block pos) {
    final Block mapSize = mapGen.gameSetting.mapSize;
    final Vector2 posPercent = Vector2(pos.x / mapSize.x, pos.y / mapSize.y);
    final double distance = posPercent.distanceTo(Vector2.all(0.5));

    for (int i = 0; i < waterWeightTable.length; i++) {
      if (distance < waterWeightTable[i][0]) {
        return waterWeightTable[i][1].toInt();
      }
    }

    return 0;
  }

  TileType getRandomTileType(Block block) {
    final int weight = getTileWeight(block);
    final num = mapGen.rand.nextInt(100);
    if (num < weight) {
      return TileType.waterShallow;
    }

    return TileType.plain;
  }
}
