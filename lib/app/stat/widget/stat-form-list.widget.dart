import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player/player.provider.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/app/stat/widget/stat-counter.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatListFormWidget extends StatefulWidget {
  final PlayerModel player;
  final List<StatConfigModel> configModelList;

  const StatListFormWidget({
    Key? key,
    required this.player,
    required this.configModelList,
  }) : super(key: key);

  @override
  _StatListFormWidgetState createState() => _StatListFormWidgetState();
}

class _StatListFormWidgetState extends State<StatListFormWidget> {
  @override
  Widget build(BuildContext context) {
    final maxHpConfig = widget.configModelList
        .firstWhere((element) => element.code == StatCode.maximumHp);

    return ListView(
      children: [
        // max hp
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getMaximumHp()!.value,
          maxHpConfig,
          true,
        ),

        // cur hp
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getCurrentHp()!.value,
          StatConfigModel(
            code: StatCode.currentHp,
            minimumPoint: 0,
            maximumPoint: widget.player.getMaximumHp()!.value,
            progressionConfigList: maxHpConfig.progressionConfigList,
          ),
          true,
        ),

        // current hp
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getCurrentHp()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.maximumHp),
          true,
        ),

        // attack
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getAttack()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.attack),
          true,
        ),

        // heal
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getHeal()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.heal),
          true,
        ),

        // range
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getRange()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.range),
          true,
        ),

        // player move
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getPlayerMove()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.playerMove),
          true,
        ),

        // luck
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getLuck()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.luck),
          true,
        ),

        // worker move
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getWorkerMove()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.workerMove),
          false,
        ),

        // gather
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getGather()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.gather),
          false,
        ),

        // scavenge
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.player.getScavenge()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.scavenge),
          false,
        ),
      ],
    );
  }

  Widget _statFormWidget(
    String imagePath,
    int value,
    StatConfigModel config,
    bool isPlayerStat,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Consumer(builder: (context, ref, child) {
          final provider = ref.read(playerProvider.notifier);

          return StatCounterWidget(
            minimum: config.minimumPoint,
            maximum: config.maximumPoint,
            value: value,
            onChange: (value) {
              if (isPlayerStat) {
                provider.updatePlayerStat(
                  widget.player.id,
                  StatModel(
                      code: config.code,
                      point: value,
                      value: value), // TODO: use correct value for point
                );
              } else {
                provider.updateWorkerStat(
                  widget.player.id,
                  StatModel(
                      code: config.code,
                      point: value,
                      value: value), // TODO: use correct value for point
                );
              }
            },
          );
        }),
      ],
    );
  }
}
