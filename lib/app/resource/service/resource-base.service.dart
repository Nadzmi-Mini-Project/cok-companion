import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/resource/service/resource-hive.service.dart';
import 'package:cokc/database/provider/resource-box.provider.dart';
import 'package:cokc/database/provider/session-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resourceServiceProvider =
    Provider<ResourceHiveService>((ref) => ResourceHiveService(
          resourceBox: ref.read(resourceBoxProvider),
          sessionBox: ref.read(sessionBoxProvider),
        ));

abstract class ResourceBaseService {
  Future<List<ResourceModel>> getAll();
  Future<ResourceModel> getById(String id);
  Future<ResourceModel> getByCode(ResourceCode code);
  Future<ResourceModel> addByPlayerIdAndWorkerId(
    String playerId,
    String workerId,
    ResourceModel model,
  );
  Future<ResourceModel> removeByPlayerIdAndWorkerId(
    String playerId,
    String workerId,
    String resourceId,
  );
}
