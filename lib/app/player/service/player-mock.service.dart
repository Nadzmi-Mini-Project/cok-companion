import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';

class PlayerMockService extends PlayerBaseService {
  List<PlayerModel> playerList = [];

  @override
  Future<PlayerModel> getById(String playerId) {
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
      workerList: [],
    ));
  }

  @override
  Future<List<PlayerModel>> getAll() {
    return Future.value(playerList);
  }

  @override
  Future<PlayerModel> create(CreatePlayerModel createPlayerModel) {
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
      workerList: const [],
    );

    playerList.add(newPlayer);

    return Future.value(newPlayer);
  }

  @override
  Future<PlayerModel> updatePlayerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) {
    return getById(playerId);
  }

  @override
  Future<PlayerModel> updateWorkerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) {
    return getById(playerId);
  }

  @override
  Future removePlayerById(String playerId) {
    return getById(playerId);
  }
}
