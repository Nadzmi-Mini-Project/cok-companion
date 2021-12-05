import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:cokc/app/worker/service/worker-base.service.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/player.box.dart';
import 'package:cokc/database/box/session.box.dart';
import 'package:cokc/database/box/stat.box.dart';
import 'package:cokc/database/box/worker.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlayerHiveService extends PlayerBaseService {
  final Box<Session> sessionBox;
  final Box<Character> characterBox;
  final WorkerBaseService workerService;
  final ConfigBaseService configService;

  PlayerHiveService({
    required this.sessionBox,
    required this.characterBox,
    required this.workerService,
    required this.configService,
  }) : super();

  @override
  Future<List<PlayerModel>> getAll() async {
    final curSession = sessionBox.get(0);

    return Future.value(
        curSession!.playerList.map((e) => Player.toModel(e)).toList());
  }

  @override
  Future<PlayerModel> getById(String playerId) async {
    final curSession = sessionBox.get(0);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);

    return Future.value(Player.toModel(player));
  }

  @override
  Future<PlayerModel> create(CreatePlayerModel createPlayerModel) async {
    final curSession = sessionBox.get(0);
    final character = characterBox.values
        .firstWhere((element) => element.id == createPlayerModel.characterId);

    final workerColor = WorkerColor.values[
        curSession!.playerList.length.clamp(0, WorkerColor.values.length)];
    final newWorkerList = await workerService.getByColor(workerColor);
    final newPlayer = Player(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      character: character,
      playerStatList: [
        Stat(code: StatCode.maximumHp.index, point: 4, value: 4),
        Stat(code: StatCode.currentHp.index, point: 4, value: 4),
        Stat(code: StatCode.attack.index, point: 1, value: 1),
        Stat(code: StatCode.heal.index, point: 1, value: 1),
        Stat(code: StatCode.range.index, point: 1, value: 1),
        Stat(code: StatCode.playerMove.index, point: 3, value: 2),
        Stat(code: StatCode.luck.index, point: 0, value: 0),
      ],
      workerStatList: [
        Stat(code: StatCode.workerMove.index, point: 1, value: 1),
        Stat(code: StatCode.gather.index, point: 1, value: 1),
        Stat(code: StatCode.scavenge.index, point: 1, value: 1),
      ],
      workerList: newWorkerList.map((e) => Worker.fromModel(e)).toList(),
    );

    curSession.playerList.add(newPlayer);

    return Future.value(Player.toModel(newPlayer));
  }

  @override
  Future<PlayerModel> updatePlayerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) async {
    final curSession = sessionBox.get(0);
    final statConfig = await configService.getStatConfigByCode(statCode);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);
    final curStat = player.playerStatList
        .firstWhere((element) => element.code == statCode.index);

    if (curStat.code == StatCode.currentHp.index) {
      final maxHpStat = player.playerStatList
          .firstWhere((element) => element.code == StatCode.maximumHp.index);

      curStat.point = (statPoint >= maxHpStat.point)
          ? maxHpStat.point
          : (statPoint <= 0)
              ? 0
              : statPoint;
      curStat.value = statConfig.getProgression(curStat.point)!.value;
    } else if (curStat.code == StatCode.maximumHp.index) {
      curStat.point = (statPoint >= statConfig.maximumPoint)
          ? statConfig.maximumPoint
          : (statPoint <= statConfig.minimumPoint)
              ? statConfig.minimumPoint
              : statPoint;
      curStat.value = statConfig.getProgression(curStat.point)!.value;

      final curHpStat = player.playerStatList
          .firstWhere((element) => element.code == StatCode.currentHp.index);

      if (curStat.point <= curHpStat.point) {
        final curHpStatConfig =
            await configService.getStatConfigByCode(StatCode.currentHp);

        curHpStat.point = (curStat.point <= 1) ? 1 : curStat.point;
        curHpStat.value = curHpStatConfig.getProgression(curStat.point)!.value;
      }
    } else {
      curStat.point = (statPoint >= statConfig.maximumPoint)
          ? statConfig.maximumPoint
          : (statPoint <= statConfig.minimumPoint)
              ? statConfig.minimumPoint
              : statPoint;
      curStat.value = statConfig.getProgression(curStat.point)!.value;
    }

    return Future.value(Player.toModel(player));
  }

  @override
  Future<PlayerModel> updateWorkerStat(
    String playerId,
    StatCode statCode,
    int statPoint,
  ) async {
    final curSession = sessionBox.get(0);
    final statConfig = await configService.getStatConfigByCode(statCode);
    final player =
        curSession!.playerList.firstWhere((element) => element.id == playerId);
    final curStat = player.workerStatList
        .firstWhere((element) => element.code == statCode.index);

    curStat.point = (statPoint >= statConfig.maximumPoint)
        ? statConfig.maximumPoint
        : (statPoint <= statConfig.minimumPoint)
            ? statConfig.minimumPoint
            : statPoint;
    curStat.value = statConfig.getProgression(curStat.point)!.value;

    return Future.value(Player.toModel(player));
  }
}
