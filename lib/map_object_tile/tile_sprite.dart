import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';

import 'tile_type.dart';
import 'tile_data.dart';
import '../war_game.dart';

class TileSprite extends SpriteComponent with HasGameRef<WarGame> {
  final Point pos;
  final TileData tileData;

  TileSprite(
      {required this.pos, required this.tileData, required super.position});

  @override
  FutureOr<void> onLoad() {
    final String imgName = switch (tileData.tileType) {
      TileType.plain => 'tiles/grass.png',
      TileType.forest => 'tiles/forest.png',
      TileType.waterShallow => 'tiles/water.png',
      _ => 'tiles/sand.png',
    };

    final img = game.images.fromCache(imgName);
    sprite = Sprite(img);
  }
}
