import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/resource/service/resource-hive.service.dart';
import 'package:cokc/app/session/service/session-base.service.dart';
import 'package:cokc/database/provider/resource-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resourceServiceProvider =
    Provider<ResourceHiveService>((ref) => ResourceHiveService(
          resourceBox: ref.read(resourceBoxProvider),
          sessionService: ref.read(sessionServiceProvider),
        ));

abstract class ResourceBaseService {
  Future<List<ResourceModel>> getAll();
  Future<ResourceModel> getById(String id);
  Future<ResourceModel> getByCode(ResourceCode code);
}
