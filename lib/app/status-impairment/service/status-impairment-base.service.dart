import 'package:cokc/app/status-impairment/enum/impairment-code.enum.dart';
import 'package:cokc/app/status-impairment/model/status-impairment.model.dart';
import 'package:cokc/app/status-impairment/service/status-impairment-hive.service.dart';
import 'package:cokc/database/provider/session-box.provider.dart';
import 'package:cokc/database/provider/status-impairment-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statusImpairmentServiceProvider =
    Provider((ref) => StatusImpairmentHiveService(
          sessionBox: ref.read(sessionBoxProvider),
          statusImpairmentBox: ref.read(statusImpairmentBoxProvider),
        ));

abstract class StatusImpairmentBaseService {
  Future<List<StatusImpairmentModel>> getAll();
  Future<StatusImpairmentModel> getById(String id);
  Future<StatusImpairmentModel> getByCode(ImpairmentCode code);
  Future<StatusImpairmentModel> addToPlayerByCode(
    String playerId,
    ImpairmentCode code,
  );
  Future removeFromPlayerByCode(
    String playerId,
    ImpairmentCode code,
  );
  Future removeAllPlayer(String playerId);
}
