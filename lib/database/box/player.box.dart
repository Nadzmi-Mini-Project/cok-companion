import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/stat.box.dart';
import 'package:cokc/database/box/status-impairment.box.dart';
import 'package:cokc/database/box/worker.box.dart';
import 'package:hive_flutter/adapters.dart';

part 'player.box.g.dart';

@HiveType(typeId: 1)
class Player extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  Character character;

  @HiveField(2)
  List<Stat> playerStatList;

  @HiveField(3)
  List<Stat> workerStatList;

  @HiveField(4)
  List<Worker> workerList;

  @HiveField(5)
  List<StatusImpairment> statusImpairmentList;

  Player({
    required this.id,
    required this.character,
    required this.playerStatList,
    required this.workerStatList,
    required this.workerList,
    required this.statusImpairmentList,
  });

  static PlayerModel toModel(Player entity) => PlayerModel(
        id: entity.id.toString(),
        character: Character.toModel(entity.character),
        playerStat: entity.playerStatList.map((e) => Stat.toModel(e)).toList(),
        workerStat: entity.workerStatList.map((e) => Stat.toModel(e)).toList(),
        workerList: entity.workerList.map((e) => Worker.toModel(e)).toList(),
        statusImpairmentList: entity.statusImpairmentList
            .map((e) => StatusImpairment.toModel(e))
            .toList(),
      );

  static Player fromModel(PlayerModel model) => Player(
        id: model.id,
        character: Character.fromModel(model.character),
        playerStatList: model.playerStat.map((e) => Stat.fromModel(e)).toList(),
        workerStatList: model.workerStat.map((e) => Stat.fromModel(e)).toList(),
        workerList: model.workerList.map((e) => Worker.fromModel(e)).toList(),
        statusImpairmentList: model.statusImpairmentList
            .map((e) => StatusImpairment.fromModel(e))
            .toList(),
      );
}
