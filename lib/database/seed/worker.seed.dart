import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/database/box/worker.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkerSeed extends BaseSeed {
  @override
  Future seed() async {
    if (Hive.box<Worker>(TableCollection.workers).length <= 0) {
      await Hive.box<Worker>(TableCollection.workers).addAll([
        // green worker
        Worker(
          id: '1',
          code: WorkerCode.green1.index,
          color: WorkerColor.green.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),
        Worker(
          id: '2',
          code: WorkerCode.green2.index,
          color: WorkerColor.green.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),

        // purple worker
        Worker(
          id: '3',
          code: WorkerCode.purple1.index,
          color: WorkerColor.purple.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),
        Worker(
          id: '4',
          code: WorkerCode.purple2.index,
          color: WorkerColor.purple.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),

        // grey worker
        Worker(
          id: '5',
          code: WorkerCode.grey1.index,
          color: WorkerColor.grey.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),
        Worker(
          id: '6',
          code: WorkerCode.grey2.index,
          color: WorkerColor.grey.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),

        // yellow worker
        Worker(
          id: '7',
          code: WorkerCode.yellow1.index,
          color: WorkerColor.yellow.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),
        Worker(
          id: '8',
          code: WorkerCode.yellow2.index,
          color: WorkerColor.yellow.index,
          imagePath:
              'asset/image/character/sample.png', // TODO: use correct image
        ),
      ]);
    }
  }
}
