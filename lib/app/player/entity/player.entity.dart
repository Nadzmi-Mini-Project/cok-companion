import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/stat/entity/stat.entity.dart';
import 'package:cokc/app/stat/enum/stat-type.enum.dart';
import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String id;
  final CharacterEntity characterEntity;
  final List<StatEntity> playerStat;
  final List<StatEntity> workerStat;

  const PlayerEntity({
    required this.id,
    required this.characterEntity,
    required this.playerStat,
    required this.workerStat,
  });

  @override
  List<Object?> get props => [
        id,
        characterEntity,
        playerStat,
        workerStat,
      ];

  @override
  bool? get stringify => true;

  // stat getter
  StatEntity? getMaximumHp() =>
      playerStat.firstWhere((element) => element.type == StatType.MaximumHp);

  StatEntity? getCurrentHp() =>
      playerStat.firstWhere((element) => element.type == StatType.CurrentHp);

  StatEntity? getAttack() =>
      playerStat.firstWhere((element) => element.type == StatType.Attack);

  StatEntity? getHeal() =>
      playerStat.firstWhere((element) => element.type == StatType.Heal);

  StatEntity? getRange() =>
      playerStat.firstWhere((element) => element.type == StatType.Range);

  StatEntity? getPlayerMove() =>
      playerStat.firstWhere((element) => element.type == StatType.PlayerMove);

  StatEntity? getLuck() =>
      playerStat.firstWhere((element) => element.type == StatType.Luck);

  StatEntity? getWorkerMove() =>
      workerStat.firstWhere((element) => element.type == StatType.WorkerMove);

  StatEntity? getGather() =>
      workerStat.firstWhere((element) => element.type == StatType.Gather);

  StatEntity? getScavenge() =>
      workerStat.firstWhere((element) => element.type == StatType.Scavenge);
}
