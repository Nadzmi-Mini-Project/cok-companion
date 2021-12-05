import 'package:cokc/database/box/resource.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final resourceBoxProvider = Provider((ref) {
  ref.onDispose(() => Hive.box<Resource>(TableCollection.resources).close());

  return Hive.box<Resource>(TableCollection.resources);
});
