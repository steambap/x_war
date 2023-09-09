import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import './war_game.dart';

void main() {
  runApp(const GameWidget.controlled(gameFactory: WarGame.new));
}
