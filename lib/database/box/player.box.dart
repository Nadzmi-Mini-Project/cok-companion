import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/stat.box.dart';
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

  Player({
    required this.id,
    required this.character,
    required this.playerStatList,
    required this.workerStatList,
  });

  static PlayerModel toModel(Player entity) => PlayerModel(
        id: entity.id.toString(),
        character: Character.toModel(entity.character),
        playerStat: entity.playerStatList.map((e) => Stat.toModel(e)).toList(),
        workerStat: entity.workerStatList.map((e) => Stat.toModel(e)).toList(),
      );

  static Player fromModel(PlayerModel model) => Player(
        id: model.id,
        character: Character.fromModel(model.character),
        playerStatList: model.playerStat.map((e) => Stat.fromModel(e)).toList(),
        workerStatList: model.workerStat.map((e) => Stat.fromModel(e)).toList(),
      );
}
