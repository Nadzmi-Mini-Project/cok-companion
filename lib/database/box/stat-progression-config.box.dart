import 'package:cokc/app/config/model/stat-progression-config.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'stat-progression-config.box.g.dart';

@HiveType(typeId: 7)
class StatProgressionConfig extends HiveObject {
  @HiveField(0)
  int point;

  @HiveField(1)
  int value;

  StatProgressionConfig({
    required this.point,
    required this.value,
  });

  static StatProgressionConfigModel toModel(StatProgressionConfig entity) =>
      StatProgressionConfigModel(
        point: entity.point,
        value: entity.value,
      );

  static StatProgressionConfig fromModel(StatProgressionConfigModel model) =>
      StatProgressionConfig(
        point: model.point,
        value: model.value,
      );
}
