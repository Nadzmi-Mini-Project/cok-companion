import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-hive.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/worker/service/worker-base.service.dart';
import 'package:cokc/database/provider/character-box.provider.dart';
import 'package:cokc/database/provider/session-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerServiceProvider =
    Provider<PlayerHiveService>((ref) => PlayerHiveService(
          sessionBox: ref.read(sessionBoxProvider),
          characterBox: ref.read(characterBoxProvider),
          workerService: ref.read(workerServiceProvider),
          configService: ref.read(configServiceProvider),
        ));

abstract class PlayerBaseService {
  Future<List<PlayerModel>> getAll();
  Future<PlayerModel> getById(String playerId);
  Future<PlayerModel> create(CreatePlayerModel createPlayerModel);
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
}
