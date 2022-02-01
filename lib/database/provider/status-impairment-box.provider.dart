import 'package:cokc/database/box/status-impairment.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final statusImpairmentBoxProvider = Provider((ref) {
  ref.onDispose(() =>
      Hive.box<StatusImpairment>(TableCollection.statusImpairment).close());

  return Hive.box<StatusImpairment>(TableCollection.statusImpairment);
});
