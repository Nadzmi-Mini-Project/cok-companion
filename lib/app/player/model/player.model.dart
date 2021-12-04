import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:equatable/equatable.dart';

class PlayerModel extends Equatable {
  final String id;
  final CharacterModel character;
  final List<StatModel> playerStat;
  final List<StatModel> workerStat;
  final List<WorkerModel> workerList;

  const PlayerModel({
    required this.id,
    required this.character,
    required this.playerStat,
    required this.workerStat,
    required this.workerList,
  });

  @override
  List<Object?> get props => [
        id,
        character,
        playerStat,
        workerStat,
      ];

  @override
  bool? get stringify => true;

  // stat getter
  StatModel? getMaximumHp() =>
      playerStat.firstWhere((element) => element.code == StatCode.maximumHp);

  StatModel? getCurrentHp() =>
      playerStat.firstWhere((element) => element.code == StatCode.currentHp);

  StatModel? getAttack() =>
      playerStat.firstWhere((element) => element.code == StatCode.attack);

  StatModel? getHeal() =>
      playerStat.firstWhere((element) => element.code == StatCode.heal);

  StatModel? getRange() =>
      playerStat.firstWhere((element) => element.code == StatCode.range);

  StatModel? getPlayerMove() =>
      playerStat.firstWhere((element) => element.code == StatCode.playerMove);

  StatModel? getLuck() =>
      playerStat.firstWhere((element) => element.code == StatCode.luck);

  StatModel? getWorkerMove() =>
      workerStat.firstWhere((element) => element.code == StatCode.workerMove);

  StatModel? getGather() =>
      workerStat.firstWhere((element) => element.code == StatCode.gather);

  StatModel? getScavenge() =>
      workerStat.firstWhere((element) => element.code == StatCode.scavenge);
}
