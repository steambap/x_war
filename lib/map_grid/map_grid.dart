import 'dart:math';
import './map_cell.dart';
import './map_component.dart';

class MapGrid {
  late List<List<MapCell>> cells;
  late final MapComponent mapComponent;

  MapGrid() {
    mapComponent = MapComponent();
  }

  void createMap() {
    const int xSize = 9;
    const int ySize = 9;
    cells =
        List.generate(xSize, (i) => List.generate(ySize, (j) => MapCell(Point(i, j))));

    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        initTiles(i, j);
      }
    }
  }

  void initTiles(int i, j) {
    // final cell = cells[i][j];
    // cell.tile.position = cell.renderPos;
    mapComponent.add(cells[i][j].tile);
  }
}
