import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'resource.box.g.dart';

@HiveType(typeId: 5)
class Resource extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  int code;

  @HiveField(2)
  String name;

  @HiveField(3)
  String imagePath;

  Resource({
    required this.id,
    required this.code,
    required this.name,
    required this.imagePath,
  });

  static ResourceModel toModel(Resource entity) => ResourceModel(
        id: entity.id.toString(),
        code: ResourceCode.values[entity.code],
        name: entity.name,
        imagePath: entity.imagePath,
      );

  static Resource fromModel(ResourceModel model) => Resource(
        id: model.id,
        code: model.code.index,
        name: model.name,
        imagePath: model.imagePath,
      );
}
