import 'package:cokc/app/session/model/session.model.dart';
import 'package:cokc/database/box/player.box.dart';
import 'package:hive_flutter/adapters.dart';

part 'session.box.g.dart';

@HiveType(typeId: 3)
class Session extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  List<Player> playerList;

  Session({
    required this.id,
    required this.playerList,
  });

  static SessionModel toModel(Session entity) => SessionModel(
        id: entity.id.toString(),
        playerList: entity.playerList.map((e) => Player.toModel(e)).toList(),
      );

  static Session fromModel(SessionModel model) => Session(
        id: model.id,
        playerList: model.playerList.map((e) => Player.fromModel(e)).toList(),
      );
}
