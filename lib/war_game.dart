import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

import './map_grid/map_grid.dart';

class WarGame extends FlameGame with HasKeyboardHandlerComponents {
  WarGame();

  final world = World();
  late final CameraComponent cam;
  late final MapGrid mapGrid = MapGrid();

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      "tiles/grass.png",
      "tiles/sand.png"
    ]);

    cam = CameraComponent(world: world);

    addAll([cam, world]);

    world.add(mapGrid.mapComponent);
    mapGrid.createMap();
  }
}