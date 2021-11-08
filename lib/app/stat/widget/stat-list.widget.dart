import 'package:cokc/app/player/entity/player.entity.dart';
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
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getAttack()!.value,
        ),

        // heal
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getHeal()!.value,
        ),

        // range
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getRange()!.value,
        ),

        // player move
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getPlayerMove()!.value,
        ),

        // luck
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getLuck()!.value,
        ),

        // worker move
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getWorkerMove()!.value,
        ),

        // gather
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getGather()!.value,
        ),

        // scavenge
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          playerEntity.getScavenge()!.value,
        ),
      ],
    );
  }

  Widget _statWidget(String imagePath, int value) {
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
        Text(value.toString()),
      ],
    );
  }
}
