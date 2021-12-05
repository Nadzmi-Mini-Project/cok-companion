import 'package:cokc/app/session/model/session.model.dart';
import 'package:cokc/app/session/service/session-base.service.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SessionHiveService extends SessionBaseService {
  final Box<Session> sessionBox;

  SessionHiveService({required this.sessionBox});

  @override
  Future<SessionModel> getCurrentSession() async {
    if (sessionBox.isEmpty) {
      await sessionBox.add(Session(id: '1', playerList: []));
    }

    return Session.toModel(sessionBox.getAt(0)!);
  }

  @override
  Future resetSession() async {
    await sessionBox.clear();
    await sessionBox.add(Session(id: '1', playerList: []));
  }
}
