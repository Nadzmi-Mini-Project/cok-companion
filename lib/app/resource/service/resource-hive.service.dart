import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/service/resource-base.service.dart';
import 'package:cokc/database/box/resource.box.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResourceHiveService extends ResourceBaseService {
  final Box<Resource> resourceBox;
  final Box<Session> sessionBox;

  ResourceHiveService({
    required this.resourceBox,
    required this.sessionBox,
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

  @override
  Future<ResourceModel> addByPlayerIdAndWorkerId(
    String playerId,
    String workerId,
    ResourceModel model,
  ) async {
    final curSession = sessionBox.get(0);
    final worker = curSession!.playerList
        .firstWhere((element) => element.id == playerId)
        .workerList
        .firstWhere((element) => element.id == workerId);
    final resource =
        resourceBox.values.firstWhere((element) => element.id == model.id);

    if (worker.resourceList.length < 6) {
      worker.resourceList.add(resource);
    }

    await curSession.save();

    return Future.value(Resource.toModel(resource));
  }

  @override
  Future<ResourceModel> removeByPlayerIdAndWorkerId(
    String playerId,
    String workerId,
    String resourceId,
  ) async {
    final curSession = sessionBox.get(0);
    final worker = curSession!.playerList
        .firstWhere((element) => element.id == playerId)
        .workerList
        .firstWhere((element) => element.id == workerId);
    final resource =
        worker.resourceList.firstWhere((element) => element.id == resourceId);

    worker.resourceList.remove(resource);
    await curSession.save();

    return Future.value(Resource.toModel(resource));
  }
}
