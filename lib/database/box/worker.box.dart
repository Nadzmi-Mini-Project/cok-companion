import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'worker.box.g.dart';

@HiveType(typeId: 4)
class Worker extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  int code;

  @HiveField(2)
  int color;

  @HiveField(3)
  String imagePath;

  Worker({
    required this.id,
    required this.code,
    required this.color,
    required this.imagePath,
  });

  static WorkerModel toModel(Worker entity) => WorkerModel(
        id: entity.id.toString(),
        code: WorkerCode.values[entity.code],
        color: WorkerColor.values[entity.color],
        imagePath: entity.imagePath,
      );

  static Worker fromModel(WorkerModel model) => Worker(
        id: model.id,
        code: model.code.index,
        color: model.color.index,
        imagePath: model.imagePath,
      );
}
