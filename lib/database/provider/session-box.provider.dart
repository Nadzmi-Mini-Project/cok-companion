import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sessionBoxProvider = Provider((ref) {
  ref.onDispose(() => Hive.box<Session>(TableCollection.sessions).close());

  return Hive.box<Session>(TableCollection.sessions);
});
