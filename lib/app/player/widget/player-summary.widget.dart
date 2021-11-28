import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerSummaryWidget extends StatelessWidget {
  final PlayerModel player;
  VoidCallback? onTap;

  PlayerSummaryWidget({
    required this.player,
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
                player.character.imagePath,
                player.character.name,
              ),
              HpBarWidget(
                  currentHp: player.getCurrentHp()!.value,
                  maximumHp: player.getMaximumHp()!.value),
              StatListWidget(player: player),
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
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
