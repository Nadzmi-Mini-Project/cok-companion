import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/stat/widget/stat.widget.dart';
import 'package:flutter/cupertino.dart';

class StatListWidget extends StatelessWidget {
  final PlayerEntity playerEntity;

  const StatListWidget({
    Key? key,
    required this.playerEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        // attack
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getAttack()!.value,
        ),

        // heal
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getHeal()!.value,
        ),

        // range
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getRange()!.value,
        ),

        // player move
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getPlayerMove()!.value,
        ),

        // luck
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getLuck()!.value,
        ),

        // worker move
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getWorkerMove()!.value,
        ),

        // gather
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getGather()!.value,
        ),

        // scavenge
        StatWidget(
          imagePath:
              'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          value: playerEntity.getScavenge()!.value,
        ),
      ],
    );
  }
}
