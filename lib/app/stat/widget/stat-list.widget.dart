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
      alignment: WrapAlignment.spaceEvenly,
      spacing: 10,
      children: [
        // attack
        _statWidget(
          'asset/icon/stat/attack.png',
          player.getAttack()!.value,
        ),

        // heal
        _statWidget(
          'asset/icon/stat/heal.png',
          player.getHeal()!.value,
        ),

        // range
        _statWidget(
          'asset/icon/stat/range.png',
          player.getRange()!.value,
        ),

        // player move
        _statWidget(
          'asset/icon/stat/player-move.png',
          player.getPlayerMove()!.value,
        ),

        // luck
        _statWidget(
          'asset/icon/stat/luck.png',
          player.getLuck()!.value,
        ),

        // worker move
        _statWidget(
          'asset/icon/stat/worker-move.png',
          player.getWorkerMove()!.value,
        ),

        // gather
        _statWidget(
          'asset/icon/stat/gather.png',
          player.getGather()!.value,
        ),

        // scavenge
        _statWidget(
          'asset/icon/stat/scavenge.png',
          player.getScavenge()!.value,
        ),
      ],
    );
  }

  Widget _statWidget(String imagePath, int value) {
    return Column(
      children: [
        SizedBox(
          width: 30.0,
          height: 30.0,
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
