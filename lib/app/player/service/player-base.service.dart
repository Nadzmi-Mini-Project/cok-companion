import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/update-player.model.dart';
import 'package:cokc/app/player/service/player-mock.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerServiceProvider = Provider((ref) => PlayerMockService());

abstract class PlayerBaseService {
  Future<PlayerEntity> getPlayerById(String playerId);
  Future<List<PlayerEntity>> getPlayerList();
  Future<PlayerEntity> createPlayer(CreatePlayerModel createPlayerModel);
  Future<PlayerEntity> updatePlayer(UpdatePlayerModel updatePlayerModel);
  Future<PlayerEntity> removePlayer(String playerId);
  Future removeAllPlayer();
}
