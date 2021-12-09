import 'package:cokc/database/box/stat-config.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final statConfigBoxProvider = Provider((ref) {
  ref.onDispose(() => Hive.box<StatConfig>(TableCollection.statConfig).close());

  return Hive.box<StatConfig>(TableCollection.statConfig);
});
