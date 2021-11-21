import 'package:cokc/app/player/model/player.model.dart';
import 'package:flutter/cupertino.dart';

class StatListWidget extends StatelessWidget {
  final PlayerModel model;

  const StatListWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        // attack
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getAttack()!.value,
        ),

        // heal
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getHeal()!.value,
        ),

        // range
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getRange()!.value,
        ),

        // player move
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getPlayerMove()!.value,
        ),

        // luck
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getLuck()!.value,
        ),

        // worker move
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getWorkerMove()!.value,
        ),

        // gather
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getGather()!.value,
        ),

        // scavenge
        _statWidget(
          'asset/image/character/sample-icon.jpg', // TODO: use correct icon
          model.getScavenge()!.value,
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
