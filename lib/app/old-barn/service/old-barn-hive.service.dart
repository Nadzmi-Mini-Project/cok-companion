import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/old-barn/service/old-barn-base.service.dart';
import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
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
  Future<OldBarnModel> update(OldBarnModel model) async {
    final curSession = sessionBox.get(0);

    curSession!.oldBarn = OldBarn.fromModel(model);

    return Future.value(OldBarn.toModel(curSession.oldBarn));
  }

  @override
  Future<OldBarnModel> addResource(ResourceModel model, int value) async {
    final curSession = sessionBox.get(0);

    switch (model.code) {
      case ResourceCode.wood:
        curSession!.oldBarn.wood += value;
        break;
      case ResourceCode.ore:
        curSession!.oldBarn.ore += value;
        break;
      case ResourceCode.fish:
        curSession!.oldBarn.fish += value;
        break;
      case ResourceCode.linen:
        curSession!.oldBarn.linen += value;
        break;
      case ResourceCode.part:
        curSession!.oldBarn.itemPart += value;
        break;
    }

    return Future.value(OldBarn.toModel(curSession.oldBarn));
  }

  @override
  Future<OldBarnModel> removeResource(ResourceModel model, int value) async {
    final curSession = sessionBox.get(0);

    switch (model.code) {
      case ResourceCode.wood:
        curSession!.oldBarn.wood = ((curSession.oldBarn.wood - value) <= 0)
            ? 0
            : curSession.oldBarn.wood - value;
        break;
      case ResourceCode.ore:
        curSession!.oldBarn.ore = ((curSession.oldBarn.ore - value) <= 0)
            ? 0
            : curSession.oldBarn.ore - value;
        break;
      case ResourceCode.fish:
        curSession!.oldBarn.fish = ((curSession.oldBarn.fish - value) <= 0)
            ? 0
            : curSession.oldBarn.fish - value;
        break;
      case ResourceCode.linen:
        curSession!.oldBarn.linen = ((curSession.oldBarn.linen - value) <= 0)
            ? 0
            : curSession.oldBarn.linen - value;
        break;
      case ResourceCode.part:
        curSession!.oldBarn.itemPart =
            ((curSession.oldBarn.itemPart - value) <= 0)
                ? 0
                : curSession.oldBarn.itemPart - value;
        break;
    }

    return Future.value(OldBarn.toModel(curSession.oldBarn));
  }
}
