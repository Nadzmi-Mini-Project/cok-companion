import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/stat/entity/stat.entity.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
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
      playerStat.firstWhere((element) => element.code == StatCode.maximumHp);

  StatEntity? getCurrentHp() =>
      playerStat.firstWhere((element) => element.code == StatCode.currentHp);

  StatEntity? getAttack() =>
      playerStat.firstWhere((element) => element.code == StatCode.attack);

  StatEntity? getHeal() =>
      playerStat.firstWhere((element) => element.code == StatCode.heal);

  StatEntity? getRange() =>
      playerStat.firstWhere((element) => element.code == StatCode.range);

  StatEntity? getPlayerMove() =>
      playerStat.firstWhere((element) => element.code == StatCode.playerMove);

  StatEntity? getLuck() =>
      playerStat.firstWhere((element) => element.code == StatCode.luck);

  StatEntity? getWorkerMove() =>
      workerStat.firstWhere((element) => element.code == StatCode.workerMove);

  StatEntity? getGather() =>
      workerStat.firstWhere((element) => element.code == StatCode.gather);

  StatEntity? getScavenge() =>
      workerStat.firstWhere((element) => element.code == StatCode.scavenge);
}
