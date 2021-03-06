import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/service/worker-base.service.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/box/worker.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkerHiveService extends WorkerBaseService {
  final Box<Worker> workerBox;
  final Box<Session> sessionBox;

  WorkerHiveService({
    required this.workerBox,
    required this.sessionBox,
  });

  @override
  Future<List<WorkerModel>> getAll() async {
    return Future.value(
        workerBox.values.map((e) => Worker.toModel(e)).toList());
  }

  @override
  Future<WorkerModel> getByCode(WorkerCode code) {
    return Future.value(Worker.toModel(
      workerBox.values.firstWhere((element) => element.code == code.index),
    ));
  }

  @override
  Future<List<WorkerModel>> getByColor(WorkerColor color) {
    return Future.value(
      workerBox.values
          .where((element) => element.color == color.index)
          .map((e) => Worker.toModel(e))
          .toList(),
    );
  }

  @override
  Future<WorkerModel> getById(String id) {
    return Future.value(Worker.toModel(
      workerBox.values.firstWhere((element) => element.id == id),
    ));
  }

  @override
  Future clearResource(String playerId, String workerId) async {
    final curSession = sessionBox.get(0);
    final worker = curSession!.playerList
        .firstWhere((element) => element.id == playerId)
        .workerList
        .firstWhere((element) => element.id == workerId);

    worker.resourceList.clear();
    await curSession.save();
  }
}
