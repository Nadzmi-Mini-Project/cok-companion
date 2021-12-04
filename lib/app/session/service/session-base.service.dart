import 'package:cokc/app/session/model/session.model.dart';
import 'package:cokc/app/session/service/session-hive.service.dart';
import 'package:cokc/database/provider/session-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionServiceProvider =
    Provider<SessionHiveService>((ref) => SessionHiveService(
          sessionBox: ref.read(sessionBoxProvider),
        ));

abstract class SessionBaseService {
  Future resetSession();
  Future<SessionModel> getCurrentSession();
}
