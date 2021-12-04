import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/service/resource-base.service.dart';
import 'package:cokc/app/session/service/session-base.service.dart';
import 'package:cokc/database/box/resource.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResourceHiveService extends ResourceBaseService {
  final Box<Resource> resourceBox;
  final SessionBaseService sessionService;

  ResourceHiveService({
    required this.resourceBox,
    required this.sessionService,
  });

  @override
  Future<List<ResourceModel>> getAll() {
    return Future.value(
        resourceBox.values.map((e) => Resource.toModel(e)).toList());
  }

  @override
  Future<ResourceModel> getByCode(ResourceCode code) {
    return Future.value(Resource.toModel(
      resourceBox.values.firstWhere((element) => element.code == code.index),
    ));
  }

  @override
  Future<ResourceModel> getById(String id) {
    return Future.value(Resource.toModel(
      resourceBox.values.firstWhere((element) => element.id == id),
    ));
  }
}
