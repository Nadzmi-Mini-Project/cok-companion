import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/database/box/stat-progression-config.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'stat-config.box.g.dart';

@HiveType(typeId: 8)
class StatConfig extends HiveObject {
  @HiveField(0)
  int code;

  @HiveField(1)
  int minimumPoint;

  @HiveField(2)
  int maximumPoint;

  @HiveField(3)
  List<StatProgressionConfig> progressionConfigList;

  StatConfig({
    required this.code,
    required this.minimumPoint,
    required this.maximumPoint,
    required this.progressionConfigList,
  });

  static StatConfigModel toModel(StatConfig entity) => StatConfigModel(
        code: StatCode.values[entity.code],
        minimumPoint: entity.minimumPoint,
        maximumPoint: entity.maximumPoint,
        progressionConfigList: entity.progressionConfigList
            .map((e) => StatProgressionConfig.toModel(e))
            .toList(),
      );

  static StatConfig fromModel(StatConfigModel model) => StatConfig(
        code: model.code.index,
        minimumPoint: model.minimumPoint,
        maximumPoint: model.maximumPoint,
        progressionConfigList: model.progressionConfigList
            .map((e) => StatProgressionConfig.fromModel(e))
            .toList(),
      );
}
