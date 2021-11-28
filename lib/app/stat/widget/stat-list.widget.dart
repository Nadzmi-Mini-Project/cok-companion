import 'package:cokc/app/player/model/player.model.dart';
import 'package:flutter/cupertino.dart';

class StatListWidget extends StatelessWidget {
  final PlayerModel player;

  const StatListWidget({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        // attack
        _statWidget(
          'asset/icon/stat/attack.png', // TODO: use correct icon
          player.getAttack()!.value,
        ),

        // heal
        _statWidget(
          'asset/icon/stat/heal.png', // TODO: use correct icon
          player.getHeal()!.value,
        ),

        // range
        _statWidget(
          'asset/icon/stat/range.png', // TODO: use correct icon
          player.getRange()!.value,
        ),

        // player move
        _statWidget(
          'asset/icon/stat/player-move.png', // TODO: use correct icon
          player.getPlayerMove()!.value,
        ),

        // luck
        _statWidget(
          'asset/icon/stat/luck.png', // TODO: use correct icon
          player.getLuck()!.value,
        ),

        // worker move
        _statWidget(
          'asset/icon/stat/worker-move.png', // TODO: use correct icon
          player.getWorkerMove()!.value,
        ),

        // gather
        _statWidget(
          'asset/icon/stat/gather.png', // TODO: use correct icon
          player.getGather()!.value,
        ),

        // scavenge
        _statWidget(
          'asset/icon/stat/scavenge.png', // TODO: use correct icon
          player.getScavenge()!.value,
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
