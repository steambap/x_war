import 'dart:math';

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
