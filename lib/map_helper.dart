import 'dart:math';

import './map_grid/hex.dart';

const direction = [
  // even rows
  [
    Point(1, 0),
    Point(0, -1),
    Point(-1, -1),
    Point(-1, 0),
    Point(-1, 1),
    Point(0, 1)
  ],
  // odd rows
  [
    Point(1, 0),
    Point(1, -1),
    Point(0, -1),
    Point(-1, 0),
    Point(0, 1),
    Point(1, 1)
  ],
];

List<Point<int>> getNeighbour(Point<int> pos, int range, Point<int> mapSize) {
  // https://www.redblobgames.com/grids/hexagons/#neighbors-offset
  final parity = pos.x & 1;
  final diff = direction[parity];
  final cells = diff.map((e) => e + pos);
  final filtered = cells
      .where((e) => e.x > -1 && e.x < mapSize.x && e.y > -1 && e.y < mapSize.y);

  return filtered.toList();
}

Hex getCubePos(Point<int> pos) {
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

  return Hex(q, r, s);
}

int getDistance(Point<int> a, Point<int> b) {
  final hexA = getCubePos(a);
  final hexB = getCubePos(b);

  return hexA.distance(hexB).toInt();
}
