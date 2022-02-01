import 'package:cokc/app/status-impairment/enum/impairment-code.enum.dart';
import 'package:cokc/app/status-impairment/model/status-impairment.model.dart';
import 'package:cokc/app/status-impairment/service/status-impairment-base.service.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/box/status-impairment.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatusImpairmentHiveService extends StatusImpairmentBaseService {
  final Box<Session> sessionBox;
  final Box<StatusImpairment> statusImpairmentBox;

  StatusImpairmentHiveService({
    required this.sessionBox,
    required this.statusImpairmentBox,
  });

  @override
  Future<List<StatusImpairmentModel>> getAll() {
    return Future.value(
      statusImpairmentBox.values
          .map((e) => StatusImpairment.toModel(e))
          .toList(),
    );
  }

  @override
  Future<StatusImpairmentModel> getByCode(ImpairmentCode code) {
    return Future.value(
      StatusImpairment.toModel(
        statusImpairmentBox.values
            .firstWhere((element) => element.code == code.index),
      ),
    );
  }

  @override
  Future<StatusImpairmentModel> getById(String id) {
    return Future.value(
      StatusImpairment.toModel(
        statusImpairmentBox.values.firstWhere((element) => element.id == id),
      ),
    );
  }

  @override
  Future<StatusImpairmentModel> addToPlayerByCode(
    String playerId,
    ImpairmentCode code,
  ) async {
    final curSession = sessionBox.get(0);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);
    final currentImpairment = player.statusImpairmentList;
    final statusImpairment = statusImpairmentBox.values
        .firstWhere((element) => element.code == code.index);

    if ((statusImpairment.code == ImpairmentCode.curse.index) &&
        currentImpairment
            .map((e) => e.code)
            .toList()
            .contains(statusImpairment.code)) {
      return Future.value(StatusImpairment.toModel(statusImpairment));
    }

    player.statusImpairmentList = List.from(player.statusImpairmentList)
      ..add(StatusImpairment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        code: statusImpairment.code,
        name: statusImpairment.name,
        imagePath: statusImpairment.imagePath,
      ));

    return Future.value(StatusImpairment.toModel(statusImpairment));
  }

  @override
  Future removeFromPlayerByCode(String playerId, ImpairmentCode code) async {
    final curSession = sessionBox.get(0);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);

    player.statusImpairmentList.remove(
      player.statusImpairmentList
          .firstWhere((element) => element.code == code.index),
    );
  }

  @override
  Future removeAllPlayer(String playerId) async {
    final curSession = sessionBox.get(0);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);

    player.statusImpairmentList.clear();
  }
}
