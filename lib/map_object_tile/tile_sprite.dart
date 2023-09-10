import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';

import 'tile_type.dart';
import 'tile_data.dart';
import '../war_game.dart';

class TileSprite extends SpriteComponent with HasGameRef<WarGame> {
  final Point pos;
  final TileData tileData;

  TileSprite({
    required this.pos,
    required this.tileData,
    required super.position
  });

  @override
  FutureOr<void> onLoad() {
    late String imgName;
    switch (tileData.tileType) {
      case TileType.plain:
        imgName = 'tiles/grass.png';
        break;
      case TileType.forest:
        imgName = 'tiles/forest.png';
      case TileType.waterShallow:
        imgName = 'tiles/water.png';
      default:
        imgName = 'tiles/sand.png';
    }

    final img = game.images.fromCache(imgName);
    sprite = Sprite(img);
  }
}
