import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/old-barn/service/old-barn-hive.service.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/database/provider/session-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oldBarnServiceProvider =
    Provider<OldBarnHiveService>((ref) => OldBarnHiveService(
          sessionBox: ref.read(sessionBoxProvider),
        ));

abstract class OldBarnBaseService {
  Future<OldBarnModel> get();
  Future<OldBarnModel> update(OldBarnModel model);
  Future<OldBarnModel> addResource(ResourceModel model, int value);
  Future<OldBarnModel> removeResource(ResourceModel model, int value);
}
