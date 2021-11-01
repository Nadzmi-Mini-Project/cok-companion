import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/widget/stat-counter.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatListFormWidget extends StatefulWidget {
  final PlayerEntity playerEntity;
  final List<StatConfigModel> configModelList;

  const StatListFormWidget({
    Key? key,
    required this.playerEntity,
    required this.configModelList,
  }) : super(key: key);

  @override
  _StatListFormWidgetState createState() => _StatListFormWidgetState();
}

class _StatListFormWidgetState extends State<StatListFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        // hp
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getMaximumHp()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.maximumHp),
          true,
        ),

        // attack
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getAttack()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.attack),
          true,
        ),

        // heal
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getHeal()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.heal),
          true,
        ),

        // range
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getRange()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.range),
          true,
        ),

        // player move
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getPlayerMove()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.playerMove),
          true,
        ),

        // luck
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getLuck()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.luck),
          true,
        ),

        // worker move
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getWorkerMove()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.workerMove),
          false,
        ),

        // gather
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getGather()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.gather),
          false,
        ),

        // scavenge
        _statFormWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          widget.playerEntity.getScavenge()!.value,
          widget.configModelList
              .firstWhere((element) => element.code == StatCode.scavenge),
          false,
        ),
      ],
    );
  }

  Widget _statFormWidget(
      String imagePath, int value, StatConfigModel config, bool isPlayerStat) {
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

        // TODO: counter widget here
        StatCounterWidget(
          minimum: config.minimumPoint,
          maximum: config.maximumPoint,
          onChange: (value) {
            // TODO: save value
            if (isPlayerStat) {}
          },
        ),
      ],
    );
  }
}
