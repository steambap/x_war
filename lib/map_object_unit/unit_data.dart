import 'unit_type.dart';
import 'unit_cpu_state.dart';
import '../player_color.dart';

class UnitData {
  final UnitType unitType;
  final int id;

  PlayerColor color = PlayerColor.grey;
  int level = 0;
  int exp = 0;
  int health = 0;
  int moral = 0;
  String name = '';
  int usedAttackTime = 0;
  double movementUsed = 0;
  bool isTurnOver = false;
  UnitCPUState cpuState = UnitCPUState.none;

  UnitData({required this.unitType, required this.id, required this.color});

  Map<String, dynamic> toJson() {
    return {
      '_class': 'UnitData',
      'unitType': unitType.toString(),
      'id': id,
      'color': color.toString(),
      'level': level,
      'exp': exp,
      'health': health,
      'moral': moral,
      'name': name,
      'usedAttackTime': usedAttackTime,
      'movementUsed': movementUsed,
      'isTurnOver': isTurnOver,
      'cpuState': cpuState.toString(),
    };
  }
}
