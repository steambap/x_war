import 'package:flame/events.dart';
import 'package:flame/game.dart';

import './map_grid/map_grid.dart';

class WarGame extends FlameGame with HasKeyboardHandlerComponents {
  WarGame();

  late final MapGrid mapGrid = MapGrid();

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();
    world.add(mapGrid.mapComponent);
    mapGrid.createMap();
  }
}
