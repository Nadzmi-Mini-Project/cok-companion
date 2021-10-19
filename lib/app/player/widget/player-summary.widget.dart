import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/stat/widget/stat.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerSummaryWidget extends StatelessWidget {
  final PlayerEntity playerEntity;
  VoidCallback? onTap;

  PlayerSummaryWidget({
    required this.playerEntity,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              _imagePlaceholder(
                playerEntity.characterEntity.imagePath,
                playerEntity.characterEntity.name,
              ),
              _hpBar(
                playerEntity.getMaximumHp()!.value,
                playerEntity.getCurrentHp()!.value,
              ),
              _statList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder(String imagePath, String name) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hpBar(int maximumHp, int currentHp) {
    return Row(
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.asset(
            'asset/image/character/sample-icon.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 17.0,
                child: LinearProgressIndicator(
                  value: (currentHp / maximumHp).toDouble(),
                  backgroundColor: Colors.red,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text('$currentHp / $maximumHp'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statList() {
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
