import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/database/box/resource.box.dart';
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

  @HiveField(4)
  List<Resource> resourceList;

  Worker({
    required this.id,
    required this.code,
    required this.color,
    required this.imagePath,
    this.resourceList = const [],
  });

  static WorkerModel toModel(Worker entity) => WorkerModel(
        id: entity.id.toString(),
        code: WorkerCode.values[entity.code],
        color: WorkerColor.values[entity.color],
        imagePath: entity.imagePath,
        resourceList:
            entity.resourceList.map((e) => Resource.toModel(e)).toList(),
      );

  static Worker fromModel(WorkerModel model) => Worker(
        id: model.id,
        code: model.code.index,
        color: model.color.index,
        imagePath: model.imagePath,
        resourceList:
            model.resourceList.map((e) => Resource.fromModel(e)).toList(),
      );
}
