import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
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
              HpBarWidget(
                  currentHp: playerEntity.getCurrentHp()!.value,
                  maximumHp: playerEntity.getMaximumHp()!.value),
              StatListWidget(playerEntity: playerEntity),
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
}
