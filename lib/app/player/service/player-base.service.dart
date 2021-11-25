import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-hive.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
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
  Future<PlayerModel> updatePlayerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  );
  Future<PlayerModel> updateWorkerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  );
  Future<PlayerModel> removePlayer(String playerId);
  Future removeAllPlayer();
}
