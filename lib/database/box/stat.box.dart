import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'stat.box.g.dart';

@HiveType(typeId: 2)
class Stat extends HiveObject {
  @HiveField(0)
  int code;

  @HiveField(1)
  int point;

  @HiveField(2)
  int value;

  Stat({
    required this.code,
    required this.point,
    required this.value,
  });

  static StatModel toModel(Stat entity) => StatModel(
        code: StatCode.values[entity.code],
        point: entity.point,
        value: entity.value,
      );

  static Stat fromModel(StatModel model) => Stat(
        code: model.code.index,
        point: model.point,
        value: model.value,
      );
}
