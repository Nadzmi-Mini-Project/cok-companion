import 'package:cokc/database/box/worker.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final workerBoxProvider = Provider((ref) {
  ref.onDispose(() => Hive.box<Worker>(TableCollection.workers).close());

  return Hive.box<Worker>(TableCollection.workers);
});
