import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-hive.service.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/database/provider/character-box.provider.dart';
import 'package:cokc/database/provider/player-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerServiceProvider =
    Provider<PlayerHiveService>((ref) => PlayerHiveService(
          characterBox: ref.read(characterBoxProvider),
          playerBox: ref.read(playerBoxProvider),
        ));

abstract class PlayerBaseService {
  Future<PlayerModel> getPlayerById(String playerId);
  Future<List<PlayerModel>> getPlayerList();
  Future<PlayerModel> createPlayer(CreatePlayerModel createPlayerModel);
  Future<PlayerModel> updatePlayer(PlayerModel player);
  Future<PlayerModel> updatePlayerStatList(
    String playerId,
    List<StatModel> statList,
  );
  Future<PlayerModel> updateWorkerStatList(
    String playerId,
    List<StatModel> statList,
  );
  Future<PlayerModel> updatePlayerStat(
    String playerId,
    StatModel stat,
  );
  Future<PlayerModel> updateWorkerStat(
    String playerId,
    StatModel stat,
  );
  Future<PlayerModel> removePlayer(String playerId);
  Future removeAllPlayer();
}
