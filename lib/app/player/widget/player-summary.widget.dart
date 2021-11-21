import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerSummaryWidget extends StatelessWidget {
  final PlayerModel model;
  VoidCallback? onTap;

  PlayerSummaryWidget({
    required this.model,
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
                model.character.imagePath,
                model.character.name,
              ),
              HpBarWidget(
                  currentHp: model.getCurrentHp()!.value,
                  maximumHp: model.getMaximumHp()!.value),
              StatListWidget(model: model),
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
