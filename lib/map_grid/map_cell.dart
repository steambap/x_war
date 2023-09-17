import 'dart:math';
import 'package:flame/components.dart';

import 'hex.dart';
import '../map_object_tile/tile_sprite.dart';
import '../map_object_loc/loc_sprite.dart';
import '../map_helper.dart' show getCubePos;

class MapCell {
  final Point<int> pos;
  late final Hex hex;
  late final Vector2 renderPos;
  late final TileSprite tile;
  late final LocSprite loc;

  MapCell(this.pos) {
    hex = getCubePos(pos);
    // https://www.redblobgames.com/grids/hexagons/#hex-to-pixel-offset
    // odd row to pixel
    final double x = 70 * sqrt(3) * (pos.y.toDouble() + 0.5 * (pos.x & 1));
    final double y = 70 * 1.5 * pos.x;
    renderPos = Vector2(x, y);
  }

  @override
  int get hashCode {
    int hash = 23;
    hash = (hash * 37) * pos.x;
    hash = (hash * 37) * pos.y;

    return hash;
  }

  @override
  bool operator ==(Object other) {
    return (other is MapCell) && super == other;
  }
}
