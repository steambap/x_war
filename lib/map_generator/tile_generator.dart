import 'dart:math';
import 'package:flame/game.dart';

import './map_generator.dart';
import '../map_object_tile/tile_type.dart';
import '../map_helper.dart';

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
  }

  void balanceMapTile(turn, max) {
    final Point<int> mapSize = mapGen.gameSetting.mapSize;

    for (int i = 0; i < mapSize.x; i++) {
      for (int j = 0; j < mapSize.y; j++) {
        final ns = getNeighbour(Point(i, j), 1, mapSize);
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

  int getTileWeight(Point<int> pos) {
    final Point<int> mapSize = mapGen.gameSetting.mapSize;
    final Vector2 posPercent = Vector2(pos.x / mapSize.x, pos.y / mapSize.y);
    final double distance = posPercent.distanceTo(Vector2.all(0.5));

    for (int i = 0; i < waterWeightTable.length; i++) {
      if (distance < waterWeightTable[i][0]) {
        return waterWeightTable[i][1].toInt();
      }
    }

    return 0;
  }

  TileType getRandomTileType(Point<int> pos) {
    final int weight = getTileWeight(pos);
    final num = mapGen.rand.nextInt(100);
    if (num < weight) {
      return TileType.waterShallow;
    }

    return TileType.plain;
  }
}
