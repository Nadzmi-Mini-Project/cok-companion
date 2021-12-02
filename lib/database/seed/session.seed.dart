import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SessionSeed extends BaseSeed {
  @override
  Future seed() async {
    if (Hive.box<Session>(TableCollection.sessions).length <= 0) {
      await Hive.box<Session>(TableCollection.sessions).add(Session(
        id: '1',
        playerList: [],
      ));
    }
  }
}
