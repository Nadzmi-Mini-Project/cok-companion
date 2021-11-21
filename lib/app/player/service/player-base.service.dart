import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-mock.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerServiceProvider = Provider((ref) => PlayerMockService());

abstract class PlayerBaseService {
  Future<PlayerModel> getPlayerById(String playerId);
  Future<List<PlayerModel>> getPlayerList();
  Future<PlayerModel> createPlayer(CreatePlayerModel createPlayerModel);
  Future<PlayerModel> updatePlayer(PlayerModel model);
  Future<PlayerModel> removePlayer(String playerId);
  Future removeAllPlayer();
}
