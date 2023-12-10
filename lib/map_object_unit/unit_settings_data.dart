import 'dart:convert';

import 'unit_type.dart';
import 'unit_movement_type.dart';
import 'unit_attack_type.dart';
import '../race.dart';
import '../game_attribute.dart';

class UnitSettingsData {
  final UnitType unitType;
  final UnitMovementType movementType;
  final UnitAttackType attackType;
  final Race race;
  final bool isHero;
  final Map<GameAttribute, int> attribute;

  UnitSettingsData({
    required this.unitType,
    required this.movementType,
    required this.attackType,
    required this.race,
    required this.isHero,
    required this.attribute,
  });

  factory UnitSettingsData.fromJson(Map<String, dynamic> data) {
    final UnitType unitType = data['unitType'];
    final UnitMovementType movementType = data['movementType'];
    final UnitAttackType attackType = data['attackType'];
    final Race race = data['race'];
    final bool isHero = data['isHero'];
    final Map<GameAttribute, int> attribute = {};
    attribute[GameAttribute.vision] = data['vision'];

    return UnitSettingsData(
        unitType: unitType,
        movementType: movementType,
        attackType: attackType,
        race: race,
        isHero: isHero,
        attribute: attribute);
  }
}
