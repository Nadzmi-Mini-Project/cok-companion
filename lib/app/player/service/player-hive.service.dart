import 'package:cokc/app/character/model/character.model.dart';
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
  List<PlayerModel> playerList = [];
  final Box<Character> characterBox;
  final Box<Player> playerBox;

  PlayerHiveService({
    required this.characterBox,
    required this.playerBox,
  }) : super();

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
        StatModel(code: StatCode.maximumHp, value: 4),
        StatModel(code: StatCode.currentHp, value: 4),
        StatModel(code: StatCode.attack, value: 1),
        StatModel(code: StatCode.heal, value: 1),
        StatModel(code: StatCode.range, value: 1),
        StatModel(code: StatCode.playerMove, value: 2),
        StatModel(code: StatCode.luck, value: 0),
      ],
      workerStat: [
        StatModel(code: StatCode.workerMove, value: 1),
        StatModel(code: StatCode.gather, value: 1),
        StatModel(code: StatCode.scavenge, value: 1),
      ],
    ));
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
        Stat(code: StatCode.maximumHp.index, value: 4),
        Stat(code: StatCode.currentHp.index, value: 4),
        Stat(code: StatCode.attack.index, value: 2),
        Stat(code: StatCode.heal.index, value: 1),
        Stat(code: StatCode.range.index, value: 1),
        Stat(code: StatCode.playerMove.index, value: 2),
        Stat(code: StatCode.luck.index, value: 0),
      ],
      workerStatList: [
        Stat(code: StatCode.workerMove.index, value: 1),
        Stat(code: StatCode.gather.index, value: 1),
        Stat(code: StatCode.scavenge.index, value: 1),
      ],
    ));
    final newPlayer = playerBox.get(newPlayerId);

    return Future.value(
      (newPlayer != null) ? Player.toModel(newPlayer) : null,
    );
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
        StatModel(code: StatCode.maximumHp, value: 5),
        StatModel(code: StatCode.currentHp, value: 3),
        StatModel(code: StatCode.attack, value: 2),
        StatModel(code: StatCode.heal, value: 2),
        StatModel(code: StatCode.range, value: 2),
        StatModel(code: StatCode.playerMove, value: 3),
        StatModel(code: StatCode.luck, value: 1),
      ],
      workerStat: const [
        StatModel(code: StatCode.workerMove, value: 2),
        StatModel(code: StatCode.gather, value: 2),
        StatModel(code: StatCode.scavenge, value: 2),
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
}
