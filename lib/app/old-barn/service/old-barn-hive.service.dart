import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/old-barn/service/old-barn-base.service.dart';
import 'package:cokc/database/box/old-barn.box.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OldBarnHiveService extends OldBarnBaseService {
  final Box<Session> sessionBox;

  OldBarnHiveService({required this.sessionBox});

  @override
  Future<OldBarnModel> get() {
    final curSession = sessionBox.get(0);

    return Future.value(OldBarn.toModel(curSession!.oldBarn));
  }

  @override
  Future<OldBarnModel> update(OldBarnModel model) {
    final curSession = sessionBox.get(0);

    curSession!.oldBarn = OldBarn.fromModel(model);
    curSession.save();

    return Future.value(OldBarn.toModel(curSession.oldBarn));
  }
}
