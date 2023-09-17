import 'dart:math';
import 'dart:ui';

import '../race.dart';
import './map_generator.dart';
import '../map_object_loc/loc_type.dart';
import '../map_object_loc/generator_loc_data.dart';
import '../map_helper.dart' show getDistance;

class LocGenerator {
  static const Map<LocType, double> locWeight = {
    LocType.city: 1,
    LocType.town: 4,
    LocType.nativeCamp: 0.5,
  };
  final MapGenerator mapGen;
  final Map<LocType, int> locCountMap = {};
  final Map<Point<int>, Map<LocType, int>> areaNumMap = {};

  LocGenerator({required this.mapGen}) {
    final int baseChance =
        (0.7 * 10.0 * (mapGen.gameSetting.mapSize.x / 35)).toInt();
    locWeight.forEach((key, value) {
      final int chance = (baseChance * value).ceil();
      locCountMap[key] = chance;
    });
  }

  createRandomLoc() {
    int distanceTest = 10;
    locCountMap[LocType.city] = locCountMap[LocType.city] ?? 8;
    while (locCountMap[LocType.city]! > 0) {
      distanceTest -= 2;
      if (distanceTest == 0) {
        break;
      }

      _createRandomLoc(distanceTest);
    }
  }

  List<Point<int>> _getPossibleLocTile(LocType locType) {
    final List<Point<int>> list = List.from(mapGen.info.landTiles);

    return list;
  }

  _createRandomLoc(int distanceTest) {
    for (final locType in locWeight.keys) {
      if (!locCountMap.containsKey(locType) || locCountMap[locType]! <= 0) {
        continue;
      }
      final list = _getPossibleLocTile(locType);
      while (list.isNotEmpty && locCountMap[locType]! > 0) {
        final int index = mapGen.rand.nextInt(list.length);
        final Point<int> pos = list.removeAt(index);
        bool isLocOK = true;
        // Check distance with other loc
        for (int i = 0; i < mapGen.info.locations.length; i++) {
          final Point<int> theirPos = mapGen.info.locations[i];
          final int minDistance =
              mapGen.mapData[theirPos.x][theirPos.y].loc?.locType != locType
                  ? 3
                  : distanceTest;
          final int distance = getDistance(pos, theirPos);
          if (distance < minDistance) {
            isLocOK = false;
            break;
          }
        }
        // Add loc to the list
        if (isLocOK) {
          late Race race;
          if (locType == LocType.city) {
            race = Race.syndicate;
          } else {
            race = Race.wildLife;
          }

          final locData = GeneratorLocData(
              locType: locType,
              playerColor: const Color.fromARGB(1, 221, 221, 221),
              race: race);
          mapGen.mapData[pos.x][pos.y].loc = locData;
          if (locType == LocType.city) {
            mapGen.info.cities.add(pos);
          }
          mapGen.info.locations.add(pos);
          locCountMap[locType] = locCountMap[locType]! - 1;
        }
      }
    }
  }
}