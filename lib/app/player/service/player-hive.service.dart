import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/player.box.dart';
import 'package:cokc/database/box/stat.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlayerHiveService extends PlayerBaseService {
  final Box<Character> characterBox;
  final Box<Player> playerBox;

  PlayerHiveService({
    required this.characterBox,
    required this.playerBox,
  }) : super();

  @override
  Future<PlayerModel> getPlayerById(String playerId) async {
    final player =
        playerBox.values.firstWhere((element) => element.id == playerId);

    return Future.value(Player.toModel(player));
  }

  @override
  Future<List<PlayerModel>> getPlayerList() {
    return Future.value(
      playerBox.values.map((e) => Player.toModel(e)).toList(),
    );
  }

  @override
  Future<PlayerModel> createPlayer(CreatePlayerModel createPlayerModel) async {
    final character = characterBox.values
        .firstWhere((element) => element.id == createPlayerModel.characterId);

    final newPlayerId = await playerBox.add(Player(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      character: character,
      playerStatList: [
        Stat(code: StatCode.maximumHp.index, point: 1, value: 4),
        Stat(code: StatCode.currentHp.index, point: 1, value: 4),
        Stat(code: StatCode.attack.index, point: 1, value: 2),
        Stat(code: StatCode.heal.index, point: 1, value: 1),
        Stat(code: StatCode.range.index, point: 1, value: 1),
        Stat(code: StatCode.playerMove.index, point: 1, value: 2),
        Stat(code: StatCode.luck.index, point: 1, value: 0),
      ],
      workerStatList: [
        Stat(code: StatCode.workerMove.index, point: 1, value: 1),
        Stat(code: StatCode.gather.index, point: 1, value: 1),
        Stat(code: StatCode.scavenge.index, point: 1, value: 1),
      ],
    ));
    final newPlayer = playerBox.get(newPlayerId);

    return Future.value(
      (newPlayer != null) ? Player.toModel(newPlayer) : null,
    );
  }

  @override
  Future<PlayerModel> updatePlayer(PlayerModel player) async {
    final currentPlayer =
        playerBox.values.firstWhere((element) => element.id == player.id);
    final playerKey = currentPlayer.key;

    await playerBox.put(playerKey, Player.fromModel(player));

    final updatedPlayer = playerBox.get(playerKey);

    return Future.value(
      (updatedPlayer != null) ? Player.toModel(updatedPlayer) : null,
    );
  }

  @override
  Future<PlayerModel> removePlayer(String playerId) async {
    final player =
        playerBox.values.firstWhere((element) => element.id == playerId);

    await playerBox.delete(player.key);

    return Future.value(Player.toModel(player));
  }

  @override
  Future removeAllPlayer() async {
    await playerBox.clear();
  }

  @override
  Future<PlayerModel> updatePlayerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) async {
    final player =
        playerBox.values.firstWhere((element) => element.id == playerId);
    final playerKey = player.key;
    final curStat = player.playerStatList
        .firstWhere((element) => element.code == statCode.index);

    curStat.value = statPoint; // TODO: get stat value based on stat point
    await playerBox.put(playerKey, player);

    final updatedPlayer = playerBox.get(playerKey);

    return Future.value(
      (updatedPlayer != null) ? Player.toModel(updatedPlayer) : null,
    );
  }

  @override
  Future<PlayerModel> updateWorkerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) async {
    final player =
        playerBox.values.firstWhere((element) => element.id == playerId);
    final playerKey = player.key;
    final curStat = player.workerStatList
        .firstWhere((element) => element.code == statCode.index);

    curStat.value = statPoint; // TODO: get stat value based on stat point
    await playerBox.put(playerKey, player);

    final updatedPlayer = playerBox.get(playerKey);

    return Future.value(
      (updatedPlayer != null) ? Player.toModel(updatedPlayer) : null,
    );
  }
}
