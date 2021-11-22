import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final characterBoxProvider = Provider.autoDispose((ref) {
  ref.onDispose(() => Hive.box<Character>(TableCollection.characters).close());

  return Hive.box<Character>(TableCollection.characters);
});
