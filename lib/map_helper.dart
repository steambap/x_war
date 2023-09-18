import 'dart:math';
import 'package:flame/components.dart';

import './map_grid/map_cell.dart';
import './map_grid/hex.dart';

const direction = [
  // even rows
  [
    Block(1, 0),
    Block(0, -1),
    Block(-1, -1),
    Block(-1, 0),
    Block(-1, 1),
    Block(0, 1)
  ],
  // odd rows
  [
    Block(1, 0),
    Block(1, -1),
    Block(0, -1),
    Block(-1, 0),
    Block(0, 1),
    Block(1, 1)
  ],
];

List<Block> getNeighbour(Block block, Block mapSize) {
  // https://www.redblobgames.com/grids/hexagons/#neighbors-offset
  final parity = block.x & 1;
  final diff = direction[parity];
  final cells = diff.map((b) => Block(b.x + block.x, b.y + block.y));
  final filtered = cells
      .where((e) => e.x > -1 && e.x < mapSize.x && e.y > -1 && e.y < mapSize.y);

  return filtered.toList();
}

Hex getCubePos(Block block) {
  late final int q;
  late final int r;

  // https://www.redblobgames.com/grids/hexagons/#conversions-offset
  // odd row to cube coord
  if (block.x % 2 == 1) {
    q = block.y - (block.x - 1) ~/ 2;
  } else {
    q = block.y - block.x ~/ 2;
  }

  r = block.x;
  final int s = -q - r;

  return Hex(q, r, s);
}

Block getPos(Hex hex) {
  final int x = hex.r;
  final int y2 = (x % 2 == 1) ? ((x - 1) ~/ 2) : (x ~/ 2);
  final int y = hex.q + y2;

  return Block(x, y);
}

int getDistance(Block a, Block b) {
  final hexA = getCubePos(a);
  final hexB = getCubePos(b);

  return hexA.distance(hexB).toInt();
}

// https://www.redblobgames.com/grids/hexagons/#pixel-to-hex
Block pixelToPos(Vector2 pixel) {
  final double x = (sqrt(3) / 3 * pixel.x - 1 / 3 * pixel.y) / MapCell.size;
  final double y = (2 / 3 * pixel.y) / MapCell.size;
  final Hex hex = cubeRound(Vector3(x, y, -x - y));

  return getPos(hex);
}

// https://www.redblobgames.com/grids/hexagons/#rounding
Hex cubeRound(Vector3 frac) {
  int q = frac.x.round();
  int r = frac.y.round();
  int s = frac.z.round();

  final qDiff = (q - frac.x).abs();
  final rDiff = (r - frac.y).abs();
  final sDiff = (s - frac.z).abs();

  if ((qDiff > rDiff) && (qDiff > sDiff)) {
    q = -r - s;
  } else if (rDiff > sDiff) {
    r = -q - s;
  } else {
    s = -q - r;
  }

  return Hex(q, r, s);
}
