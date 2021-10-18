import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/player/entity/player-stat.entity.dart';
import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/update-player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/worker/entity/worker-stat.entity.dart';

class PlayerMockService extends PlayerBaseService {
  @override
  Future<PlayerEntity> getPlayerById(String playerId) {
    return Future.value(const PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: '...',
      ),
      playerStatEntity: PlayerStatEntity(
        maximumHp: 4,
        currentHp: 4,
        attack: 1,
        heal: 1,
        range: 1,
        move: 2,
        luck: 0,
      ),
      workerStatEntity: WorkerStatEntity(
        move: 1,
        gather: 1,
        scavenge: 1,
      ),
    ));
  }

  @override
  Future<List<PlayerEntity>> getPlayerList() {
    return Future.value([
      const PlayerEntity(
        id: '1',
        characterEntity: CharacterEntity(
          id: '1',
          name: 'Character 1',
          imagePath: '...',
        ),
        playerStatEntity: PlayerStatEntity(
          maximumHp: 4,
          currentHp: 4,
          attack: 1,
          heal: 1,
          range: 1,
          move: 2,
          luck: 0,
        ),
        workerStatEntity: WorkerStatEntity(
          move: 1,
          gather: 1,
          scavenge: 1,
        ),
      ),
      const PlayerEntity(
        id: '2',
        characterEntity: CharacterEntity(
          id: '2',
          name: 'Character 2',
          imagePath: '...',
        ),
        playerStatEntity: PlayerStatEntity(
          maximumHp: 4,
          currentHp: 4,
          attack: 1,
          heal: 1,
          range: 1,
          move: 2,
          luck: 0,
        ),
        workerStatEntity: WorkerStatEntity(
          move: 1,
          gather: 1,
          scavenge: 1,
        ),
      ),
      const PlayerEntity(
        id: '3',
        characterEntity: CharacterEntity(
          id: '3',
          name: 'Character 3',
          imagePath: '...',
        ),
        playerStatEntity: PlayerStatEntity(
          maximumHp: 4,
          currentHp: 4,
          attack: 1,
          heal: 1,
          range: 1,
          move: 2,
          luck: 0,
        ),
        workerStatEntity: WorkerStatEntity(
          move: 1,
          gather: 1,
          scavenge: 1,
        ),
      ),
      const PlayerEntity(
        id: '4',
        characterEntity: CharacterEntity(
          id: '4',
          name: 'Character 4',
          imagePath: '...',
        ),
        playerStatEntity: PlayerStatEntity(
          maximumHp: 4,
          currentHp: 4,
          attack: 1,
          heal: 1,
          range: 1,
          move: 2,
          luck: 0,
        ),
        workerStatEntity: WorkerStatEntity(
          move: 1,
          gather: 1,
          scavenge: 1,
        ),
      ),
    ]);
  }

  @override
  Future<PlayerEntity> createPlayer(CreatePlayerModel createPlayerModel) {
    return Future.value(const PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: '...',
      ),
      playerStatEntity: PlayerStatEntity(
        maximumHp: 4,
        currentHp: 4,
        attack: 1,
        heal: 1,
        range: 1,
        move: 2,
        luck: 0,
      ),
      workerStatEntity: WorkerStatEntity(
        move: 1,
        gather: 1,
        scavenge: 1,
      ),
    ));
  }

  @override
  Future<PlayerEntity> updatePlayer(UpdatePlayerModel updatePlayerModel) {
    return Future.value(const PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: '...',
      ),
      playerStatEntity: PlayerStatEntity(
        maximumHp: 4,
        currentHp: 4,
        attack: 1,
        heal: 1,
        range: 1,
        move: 2,
        luck: 0,
      ),
      workerStatEntity: WorkerStatEntity(
        move: 1,
        gather: 1,
        scavenge: 1,
      ),
    ));
  }

  @override
  Future<PlayerEntity> removePlayer(String playerId) {
    return Future.value(const PlayerEntity(
      id: '1',
      characterEntity: CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: '...',
      ),
      playerStatEntity: PlayerStatEntity(
        maximumHp: 4,
        currentHp: 4,
        attack: 1,
        heal: 1,
        range: 1,
        move: 2,
        luck: 0,
      ),
      workerStatEntity: WorkerStatEntity(
        move: 1,
        gather: 1,
        scavenge: 1,
      ),
    ));
  }

  @override
  Future removeAllPlayer() {
    return Future.value();
  }
}
