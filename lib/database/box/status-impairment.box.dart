import 'package:cokc/app/status-impairment/enum/impairment-code.enum.dart';
import 'package:cokc/app/status-impairment/model/status-impairment.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'status-impairment.box.g.dart';

@HiveType(typeId: 9)
class StatusImpairment extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  int code;

  @HiveField(2)
  String name;

  @HiveField(3)
  String imagePath;

  StatusImpairment({
    required this.id,
    required this.code,
    required this.name,
    required this.imagePath,
  });

  static StatusImpairmentModel toModel(StatusImpairment entity) =>
      StatusImpairmentModel(
        id: entity.id.toString(),
        code: ImpairmentCode.values[entity.code],
        name: entity.name,
        imagePath: entity.imagePath,
      );

  static StatusImpairment fromModel(StatusImpairmentModel model) =>
      StatusImpairment(
        id: model.id,
        code: model.code.index,
        name: model.name,
        imagePath: model.imagePath,
      );
}
