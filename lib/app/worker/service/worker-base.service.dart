import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/app/worker/service/worker-hive.service.dart';
import 'package:cokc/database/provider/worker-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerServiceProvider =
    Provider<WorkerHiveService>((ref) => WorkerHiveService(
          workerBox: ref.read(workerBoxProvider),
        ));

abstract class WorkerBaseService {
  Future<List<WorkerModel>> getAll();
  Future<WorkerModel> getById(String id);
  Future<WorkerModel> getByCode(WorkerCode code);
  Future<List<WorkerModel>> getByColor(WorkerColor color);
}
