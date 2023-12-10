import '../map_object_tile/tile_type.dart';
import '../game_attribute.dart';
import 'unit_movement_type.dart';

class ConfigUnit {
  static const List<GameAttribute> displayAttribute = [
    GameAttribute.vision,
    GameAttribute.health,
    GameAttribute.regeneration,
    GameAttribute.moral,
    GameAttribute.moralReg,
    GameAttribute.attack,
    GameAttribute.heal,
    GameAttribute.defendMelee,
    GameAttribute.defendRange,
    GameAttribute.movePoint,
    GameAttribute.rateDamageSend,
    GameAttribute.rateDamageGet,
    GameAttribute.rateHealSend,
    GameAttribute.rateHealGet,
    GameAttribute.rateCrit,
    GameAttribute.rateCritDamage
  ];

  static const Map<UnitMovementType, Map<TileType, double>> movementCostMap = {
    UnitMovementType.land: {
      TileType.plain: 1,
      TileType.forest: 2,
      TileType.hill: 2,
      TileType.mountain: -1,
      TileType.swamp: 3,
      TileType.waterShallow: 99,
      TileType.waterDeep: -1,
    },
    UnitMovementType.vehicle: {
      TileType.plain: 1,
      TileType.forest: 3,
      TileType.hill: 3,
      TileType.mountain: -1,
      TileType.swamp: 4,
      TileType.waterShallow: 99,
      TileType.waterDeep: -1,
    },
    UnitMovementType.air: {
      TileType.plain: 1,
      TileType.forest: 1,
      TileType.hill: 1,
      TileType.mountain: 1,
      TileType.swamp: 1,
      TileType.waterShallow: 1,
      TileType.waterDeep: 1,
    },
    UnitMovementType.navy: {
      TileType.plain: -1,
      TileType.forest: -1,
      TileType.hill: -1,
      TileType.mountain: -1,
      TileType.swamp: -1,
      TileType.waterShallow: 1,
      TileType.waterDeep: 1,
    },
    UnitMovementType.amphibous: {
      TileType.plain: 1,
      TileType.forest: 3,
      TileType.hill: 3,
      TileType.mountain: -1,
      TileType.swamp: 1,
      TileType.waterShallow: 1,
      TileType.waterDeep: 2,
    },
  };

  static const Map<UnitMovementType, Map<TileType, Map<GameAttribute, int>>>
      tileBonusMap = {
    UnitMovementType.land: {
      TileType.plain: {},
      TileType.forest: {GameAttribute.rateDamageGet: -15},
      TileType.hill: {
        GameAttribute.rateDamageGet: -15,
        GameAttribute.rateDamageSend: 15
      },
      TileType.mountain: {},
      TileType.swamp: {
        GameAttribute.rateDamageGet: 15,
        GameAttribute.rateDamageSend: -15
      },
      TileType.waterShallow: {
        GameAttribute.rateDamageGet: 20,
        GameAttribute.rateDamageSend: -20
      },
      TileType.waterDeep: {
        GameAttribute.rateDamageGet: 30,
        GameAttribute.rateDamageSend: -30
      },
    },
    UnitMovementType.vehicle: {
      TileType.plain: {},
      TileType.forest: {GameAttribute.rateDamageGet: -15},
      TileType.hill: {
        GameAttribute.rateDamageGet: -15,
        GameAttribute.rateDamageSend: 15
      },
      TileType.mountain: {},
      TileType.swamp: {
        GameAttribute.rateDamageGet: 30,
        GameAttribute.rateDamageSend: -30
      },
      TileType.waterShallow: {
        GameAttribute.rateDamageGet: 30,
        GameAttribute.rateDamageSend: -30
      },
      TileType.waterDeep: {
        GameAttribute.rateDamageGet: 30,
        GameAttribute.rateDamageSend: -30
      },
    },
    UnitMovementType.air: {
      TileType.plain: {},
      TileType.forest: {},
      TileType.hill: {},
      TileType.mountain: {},
      TileType.swamp: {},
      TileType.waterShallow: {},
      TileType.waterDeep: {},
    },
    UnitMovementType.navy: {
      TileType.plain: {},
      TileType.forest: {},
      TileType.hill: {},
      TileType.mountain: {},
      TileType.swamp: {},
      TileType.waterShallow: {},
      TileType.waterDeep: {},
    },
    UnitMovementType.amphibous: {
      TileType.plain: {},
      TileType.forest: {GameAttribute.rateDamageGet: -15},
      TileType.hill: {
        GameAttribute.rateDamageGet: -15,
        GameAttribute.rateDamageSend: 15
      },
      TileType.mountain: {},
      TileType.swamp: {},
      TileType.waterShallow: {},
      TileType.waterDeep: {},
    },
  };
}
