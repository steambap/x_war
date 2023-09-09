import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';

import '../war_game.dart';

class TileSprite extends SpriteComponent with HasGameRef<WarGame> {
  TileSprite({
    required this.pos,
    required super.position
  });

  late final Point pos;

  @override
  FutureOr<void> onLoad() {
    final img1 = game.images.fromCache('tiles/grass.png');
    final img2 = game.images.fromCache('tiles/sand.png');
    final img = (pos.x + pos.y) % 2 == 0 ? img1 : img2;
    sprite = Sprite(img);
  }
}
