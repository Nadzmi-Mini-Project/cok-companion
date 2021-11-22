import 'package:cokc/database/box/player.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final playerBoxProvider = Provider((ref) {
  ref.onDispose(() => Hive.box<Player>(TableCollection.players).close());

  return Hive.box<Player>(TableCollection.players);
});
