import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/update-player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/stat/entity/stat.entity.dart';
import 'package:cokc/app/stat/enum/stat-type.enum.dart';

class PlayerMockService extends PlayerBaseService {
  List<PlayerEntity> playerList = [];

  @override
  Future<PlayerEntity> getPlayerById(String playerId) {
    return Future.value(const PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: [
        StatEntity(type: StatType.MaximumHp, value: 4),
        StatEntity(type: StatType.CurrentHp, value: 4),
        StatEntity(type: StatType.Attack, value: 1),
        StatEntity(type: StatType.Heal, value: 1),
        StatEntity(type: StatType.Range, value: 1),
        StatEntity(type: StatType.PlayerMove, value: 2),
        StatEntity(type: StatType.Luck, value: 0),
      ],
      workerStat: [
        StatEntity(type: StatType.WorkerMove, value: 1),
        StatEntity(type: StatType.Gather, value: 1),
        StatEntity(type: StatType.Scavenge, value: 1),
      ],
    ));
  }

  @override
  Future<List<PlayerEntity>> getPlayerList() {
    return Future.value(playerList);
  }

  @override
  Future<PlayerEntity> createPlayer(CreatePlayerModel createPlayerModel) {
    const newPlayer = PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: [
        StatEntity(type: StatType.MaximumHp, value: 4),
        StatEntity(type: StatType.CurrentHp, value: 4),
        StatEntity(type: StatType.Attack, value: 1),
        StatEntity(type: StatType.Heal, value: 1),
        StatEntity(type: StatType.Range, value: 1),
        StatEntity(type: StatType.PlayerMove, value: 2),
        StatEntity(type: StatType.Luck, value: 0),
      ],
      workerStat: [
        StatEntity(type: StatType.WorkerMove, value: 1),
        StatEntity(type: StatType.Gather, value: 1),
        StatEntity(type: StatType.Scavenge, value: 1),
      ],
    );

    playerList.add(newPlayer);

    return Future.value(newPlayer);
  }

  @override
  Future<PlayerEntity> updatePlayer(UpdatePlayerModel updatePlayerModel) {
    const updatedPlayer = PlayerEntity(
      id: '1 updated',
      characterEntity: CharacterEntity(
        id: '1 updated',
        name: 'Character 1 updated',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: [
        StatEntity(type: StatType.MaximumHp, value: 5),
        StatEntity(type: StatType.CurrentHp, value: 3),
        StatEntity(type: StatType.Attack, value: 2),
        StatEntity(type: StatType.Heal, value: 2),
        StatEntity(type: StatType.Range, value: 2),
        StatEntity(type: StatType.PlayerMove, value: 3),
        StatEntity(type: StatType.Luck, value: 1),
      ],
      workerStat: [
        StatEntity(type: StatType.WorkerMove, value: 2),
        StatEntity(type: StatType.Gather, value: 2),
        StatEntity(type: StatType.Scavenge, value: 2),
      ],
    );

    playerList[playerList.length - 1] = updatedPlayer;

    return Future.value(updatedPlayer);
  }

  @override
  Future<PlayerEntity> removePlayer(String playerId) {
    var deletedPlayer = playerList[playerList.length - 1];

    playerList.removeLast();

    return Future.value(deletedPlayer);
  }

  @override
  Future removeAllPlayer() async {
    playerList.clear();
  }
}
