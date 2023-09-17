import 'dart:async';
import 'package:flame/components.dart';

import 'loc_type.dart';
import 'loc_game_info.dart';
import '../war_game.dart';

class LocSprite extends SpriteComponent with HasGameRef<WarGame> {
  final LocGameInfo info;

  LocSprite({required this.info, required super.position});

  @override
  FutureOr<void> onLoad() {
    final String imgName = switch (info.locType) {
      LocType.city => "loc/hq.png",
      LocType.town => "loc/town.png",
      LocType.nativeCamp => "loc/camp.png",
    };

    final img = game.images.fromCache(imgName);
    sprite = Sprite(img);
  }
}
