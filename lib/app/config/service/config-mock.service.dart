import 'dart:convert';

import 'package:cokc/app/config/model/config.model.dart';
import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/config/model/stat-progression-config.model.dart';
import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';

class ConfigMockService extends ConfigBaseService {
  final List<StatConfigModel> statConfigList = [
    StatConfigModel(
      code: StatCode.maximumHp,
      minimumPoint: 1,
      maximumPoint: 25,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5},{"point":6,"value":6},{"point":7,"value":7},{"point":8,"value":8},{"point":9,"value":9},{"point":10,"value":10},{"point":11,"value":11},{"point":12,"value":12},{"point":13,"value":13},{"point":14,"value":14},{"point":15,"value":15},{"point":16,"value":16},{"point":17,"value":17},{"point":18,"value":18},{"point":19,"value":19},{"point":20,"value":20},{"point":21,"value":21},{"point":22,"value":22},{"point":23,"value":23},{"point":24,"value":24},{"point":25,"value":25}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.currentHp,
      minimumPoint: 1,
      maximumPoint: 25,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5},{"point":6,"value":6},{"point":7,"value":7},{"point":8,"value":8},{"point":9,"value":9},{"point":10,"value":10},{"point":11,"value":11},{"point":12,"value":12},{"point":13,"value":13},{"point":14,"value":14},{"point":15,"value":15},{"point":16,"value":16},{"point":17,"value":17},{"point":18,"value":18},{"point":19,"value":19},{"point":20,"value":20},{"point":21,"value":21},{"point":22,"value":22},{"point":23,"value":23},{"point":24,"value":24},{"point":25,"value":25}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.attack,
      minimumPoint: 1,
      maximumPoint: 10,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5},{"point":6,"value":6},{"point":7,"value":7},{"point":8,"value":8},{"point":9,"value":9},{"point":10,"value":10}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.heal,
      minimumPoint: 1,
      maximumPoint: 10,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5},{"point":6,"value":6},{"point":7,"value":7},{"point":8,"value":8},{"point":9,"value":9},{"point":10,"value":10}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.range,
      minimumPoint: 1,
      maximumPoint: 10,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":1},{"point":3,"value":2},{"point":4,"value":2},{"point":5,"value":3},{"point":6,"value":3},{"point":7,"value":4},{"point":8,"value":4},{"point":9,"value":4},{"point":10,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.playerMove,
      minimumPoint: 1,
      maximumPoint: 10,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":1},{"point":3,"value":2},{"point":4,"value":2},{"point":5,"value":3},{"point":6,"value":3},{"point":7,"value":4},{"point":8,"value":4},{"point":9,"value":4},{"point":10,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.luck,
      minimumPoint: 1,
      maximumPoint: 10,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":0,"value":0},{"point":1,"value":1},{"point":2,"value":1},{"point":3,"value":2},{"point":4,"value":2},{"point":5,"value":3},{"point":6,"value":3},{"point":7,"value":4},{"point":8,"value":4},{"point":9,"value":4},{"point":10,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.workerMove,
      minimumPoint: 1,
      maximumPoint: 5,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.gather,
      minimumPoint: 1,
      maximumPoint: 5,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
    StatConfigModel(
      code: StatCode.scavenge,
      minimumPoint: 1,
      maximumPoint: 5,
      progressionConfigList: List.from(jsonDecode(
        '[{"point":1,"value":1},{"point":2,"value":2},{"point":3,"value":3},{"point":4,"value":4},{"point":5,"value":5}]',
      )).map((e) => StatProgressionConfigModel.fromJson(e)).toList(),
    ),
  ];

  @override
  Future<ConfigModel> getConfigById(String configId) {
    return Future.value(const ConfigModel(
      id: '1',
      code: 'code',
      value: 'value',
    ));
  }

  @override
  Future<ConfigModel> getConfigByCode(String configCode) {
    return Future.value(const ConfigModel(
      id: '1',
      code: 'code',
      value: 'value',
    ));
  }

  @override
  Future<List<ConfigModel>> getConfigList() {
    return Future.value([
      const ConfigModel(
        id: '1',
        code: 'code',
        value: 'value',
      ),
    ]);
  }

  @override
  Future<List<StatConfigModel>> getStatConfigList() {
    return Future.value(statConfigList);
  }

  @override
  Future<StatConfigModel> getStatConfigByCode(StatCode code) {
    return Future.value(
      statConfigList.firstWhere((element) => element.code == code),
    );
  }
}
