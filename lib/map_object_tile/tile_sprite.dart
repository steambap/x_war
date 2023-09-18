import 'dart:async';
import 'package:flame/components.dart';

import 'tile_type.dart';
import 'tile_data.dart';
import '../war_game.dart';

class TileSprite extends SpriteComponent with HasGameRef<WarGame> {
  final Block block;
  final TileData tileData;

  TileSprite(
      {required this.block, required this.tileData, required super.position});

  @override
  FutureOr<void> onLoad() {
    final String imgName = switch (tileData.tileType) {
      TileType.plain => 'tiles/grass.png',
      TileType.forest => 'tiles/forest.png',
      TileType.hill => 'tiles/hill.png',
      TileType.mountain => 'tiles/mountain.png',
      TileType.swamp => 'tiles/swamp.png',
      TileType.waterShallow => 'tiles/water.png',
      TileType.waterDeep => 'tiles/water_deep.png',
      _ => 'tiles/sand.png',
    };

    final img = game.images.fromCache(imgName);
    sprite = Sprite(img);
  }
}
