import 'dart:math';
import 'package:flame/components.dart';

import 'hex.dart';
import '../map_object_tile/tile_sprite.dart';
import '../map_object_loc/loc_sprite.dart';
import '../map_helper.dart' show getCubePos;

class MapCell {
  static const double size = 70;
  final Block block;
  late final Hex hex;
  late final Vector2 renderPos;
  late final TileSprite tile;
  late final LocSprite loc;

  MapCell(this.block) {
    hex = getCubePos(block);
    // https://www.redblobgames.com/grids/hexagons/#hex-to-pixel-offset
    // odd row to pixel
    final double x = size * sqrt(3) * (block.y.toDouble() + 0.5 * (block.x & 1));
    final double y = size * 1.5 * block.x;
    renderPos = Vector2(x, y);
  }

  @override
  int get hashCode {
    int hash = 23;
    hash = (hash * 37) * block.x;
    hash = (hash * 37) * block.y;

    return hash;
  }

  @override
  bool operator ==(Object other) {
    return (other is MapCell) && super == other;
  }
}
