import 'package:cokc/database/base.database.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/player.box.dart';
import 'package:cokc/database/box/resource.box.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/box/stat.box.dart';
import 'package:cokc/database/box/worker.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainDatabase extends BaseDatabase {
  @override
  Future init({List<BaseSeed> seederList = const []}) async {
    await Hive.initFlutter();

    Hive.registerAdapter(CharacterAdapter());
    Hive.registerAdapter(PlayerAdapter());
    Hive.registerAdapter(StatAdapter());
    Hive.registerAdapter(SessionAdapter());
    Hive.registerAdapter(WorkerAdapter());
    Hive.registerAdapter(ResourceAdapter());

    if (!Hive.isBoxOpen(TableCollection.characters)) {
      await Hive.openBox<Character>(TableCollection.characters);
    }
    if (!Hive.isBoxOpen(TableCollection.players)) {
      await Hive.openBox<Player>(TableCollection.players);
    }
    if (!Hive.isBoxOpen(TableCollection.sessions)) {
      await Hive.openBox<Session>(TableCollection.sessions);
    }
    if (!Hive.isBoxOpen(TableCollection.workers)) {
      await Hive.openBox<Worker>(TableCollection.workers);
    }
    if (!Hive.isBoxOpen(TableCollection.resources)) {
      await Hive.openBox<Resource>(TableCollection.resources);
    }

    if (seederList.isNotEmpty) {
      for (var seeder in seederList) {
        await seeder.seed();
      }
    }
  }
}
