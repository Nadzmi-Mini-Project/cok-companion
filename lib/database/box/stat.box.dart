import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'stat.box.g.dart';

@HiveType(typeId: 2)
class Stat extends HiveObject {
  @HiveField(0)
  final int
      code; // TODO: find a way to convert stat code enum to string for code

  @HiveField(1)
  final int value;

  Stat({
    required this.code,
    required this.value,
  });

  static StatModel toModel(Stat entity) => StatModel(
        code: StatCode.values[entity.code],
        value: entity.value,
      );

  static Stat fromModel(StatModel model) => Stat(
        code: model.code.index,
        value: model.value,
      );
}
