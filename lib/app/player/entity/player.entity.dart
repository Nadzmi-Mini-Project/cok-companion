import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/player/entity/player-stat.entity.dart';
import 'package:cokc/app/worker/entity/worker-stat.entity.dart';
import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String id;
  final CharacterEntity characterEntity;
  final PlayerStatEntity playerStatEntity;
  final WorkerStatEntity workerStatEntity;

  const PlayerEntity({
    required this.id,
    required this.characterEntity,
    required this.playerStatEntity,
    required this.workerStatEntity,
  });

  @override
  List<Object?> get props => [
        id,
        characterEntity,
        playerStatEntity,
        workerStatEntity,
      ];

  @override
  bool? get stringify => true;
}
