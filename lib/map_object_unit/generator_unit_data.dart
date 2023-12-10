import 'unit_type.dart';
import 'unit_cpu_state.dart';
import '../player_color.dart';

class GeneratorUnitData {
  final UnitType unitType;
  final PlayerColor color;

  UnitCPUState cpuState = UnitCPUState.garrison;

  GeneratorUnitData({required this.unitType, required this.color});
}
