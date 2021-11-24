import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';

class PlayerMockService extends PlayerBaseService {
  List<PlayerModel> playerList = [];

  @override
  Future<PlayerModel> getPlayerById(String playerId) {
    return Future.value(const PlayerModel(
      id: '1',
      character: CharacterModel(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: [
        StatModel(code: StatCode.maximumHp, point: 1, value: 4),
        StatModel(code: StatCode.currentHp, point: 1, value: 4),
        StatModel(code: StatCode.attack, point: 1, value: 1),
        StatModel(code: StatCode.heal, point: 1, value: 1),
        StatModel(code: StatCode.range, point: 1, value: 1),
        StatModel(code: StatCode.playerMove, point: 1, value: 2),
        StatModel(code: StatCode.luck, point: 1, value: 0),
      ],
      workerStat: [
        StatModel(code: StatCode.workerMove, point: 1, value: 1),
        StatModel(code: StatCode.gather, point: 1, value: 1),
        StatModel(code: StatCode.scavenge, point: 1, value: 1),
      ],
    ));
  }

  @override
  Future<List<PlayerModel>> getPlayerList() {
    return Future.value(playerList);
  }

  @override
  Future<PlayerModel> createPlayer(CreatePlayerModel createPlayerModel) {
    var newPlayer = PlayerModel(
      id: '${playerList.length}',
      character: const CharacterModel(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: const [
        StatModel(code: StatCode.maximumHp, point: 1, value: 4),
        StatModel(code: StatCode.currentHp, point: 1, value: 4),
        StatModel(code: StatCode.attack, point: 1, value: 2),
        StatModel(code: StatCode.heal, point: 1, value: 1),
        StatModel(code: StatCode.range, point: 1, value: 1),
        StatModel(code: StatCode.playerMove, point: 1, value: 2),
        StatModel(code: StatCode.luck, point: 1, value: 0),
      ],
      workerStat: const [
        StatModel(code: StatCode.workerMove, point: 1, value: 1),
        StatModel(code: StatCode.gather, point: 1, value: 1),
        StatModel(code: StatCode.scavenge, point: 1, value: 1),
      ],
    );

    playerList.add(newPlayer);

    return Future.value(newPlayer);
  }

  @override
  Future<PlayerModel> updatePlayer(PlayerModel player) {
    var updatedPlayer = PlayerModel(
      id: player.id,
      character: const CharacterModel(
        id: '1 updated',
        name: 'Character 1 updated',
        imagePath: 'asset/image/character/sample.png',
      ),
      playerStat: const [
        StatModel(code: StatCode.maximumHp, point: 1, value: 5),
        StatModel(code: StatCode.currentHp, point: 1, value: 3),
        StatModel(code: StatCode.attack, point: 1, value: 2),
        StatModel(code: StatCode.heal, point: 1, value: 2),
        StatModel(code: StatCode.range, point: 1, value: 2),
        StatModel(code: StatCode.playerMove, point: 1, value: 3),
        StatModel(code: StatCode.luck, point: 1, value: 1),
      ],
      workerStat: const [
        StatModel(code: StatCode.workerMove, point: 1, value: 2),
        StatModel(code: StatCode.gather, point: 1, value: 2),
        StatModel(code: StatCode.scavenge, point: 1, value: 2),
      ],
    );

    var currentData =
        playerList.firstWhere((element) => element.id == updatedPlayer.id);
    playerList[playerList.indexOf(currentData)] = updatedPlayer;

    return Future.value(updatedPlayer);
  }

  @override
  Future<PlayerModel> removePlayer(String playerId) {
    var deletedPlayer = playerList[playerList.length - 1];

    playerList.removeLast();

    return Future.value(deletedPlayer);
  }

  @override
  Future removeAllPlayer() async {
    playerList.clear();
  }

  @override
  Future<PlayerModel> updatePlayerStatList(
      String playerId, List<StatModel> statList) {
    // TODO: implement updatePlayerStat
    throw UnimplementedError();
  }

  @override
  Future<PlayerModel> updateWorkerStatList(
      String playerId, List<StatModel> statList) {
    // TODO: implement updateWorkerStat
    throw UnimplementedError();
  }

  @override
  Future<PlayerModel> updatePlayerStat(String playerId, StatModel stat) {
    // TODO: implement updatePlayerStat
    throw UnimplementedError();
  }

  @override
  Future<PlayerModel> updateWorkerStat(String playerId, StatModel stat) {
    // TODO: implement updateWorkerStat
    throw UnimplementedError();
  }
}
