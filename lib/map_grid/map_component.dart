import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import '../war_game.dart';

class MapComponent extends Component with HasGameRef<WarGame>, KeyboardHandler {
  final double moveSpeed = 20;
  Vector2 direction = Vector2.zero();

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    direction = Vector2.zero();
    direction.x += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    direction.x += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;

    direction.y += (keysPressed.contains(LogicalKeyboardKey.keyW) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp))
        ? -1
        : 0;
    direction.y += (keysPressed.contains(LogicalKeyboardKey.keyS) ||
            keysPressed.contains(LogicalKeyboardKey.arrowDown))
        ? 1
        : 0;

    return true;
  }

  @override
  void update(double dt) {
    final Vector2 velocity = direction * moveSpeed;

    game.cam.moveBy(velocity);
    super.update(dt);
  }
}
