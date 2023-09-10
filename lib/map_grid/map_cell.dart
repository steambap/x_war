import 'dart:math';
import 'package:flame/components.dart';

import 'hex.dart';
import '../map_object_tile/tile_sprite.dart';

class MapCell {
  final Point<int> pos;
  late final Vector2 renderPos;
  late final Hex hex;
  late final TileSprite tile;

  MapCell(this.pos) {
    late final int q;
    late final int r;

    // https://www.redblobgames.com/grids/hexagons/#conversions-offset
    // odd row to cube coord
    if (pos.x % 2 == 1) {
      q = pos.y - (pos.x - 1) ~/ 2;
    } else {
      q = pos.y - pos.x ~/ 2;
    }

    r = pos.x;
    final int s = -q - r;

    hex = Hex(q, r, s);
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
