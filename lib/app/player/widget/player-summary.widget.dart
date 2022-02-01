import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerSummaryWidget extends StatelessWidget {
  final PlayerModel player;
  final VoidCallback? onTap;

  const PlayerSummaryWidget({
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
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    HpBarWidget(
                      currentHp: player.getCurrentHp()!.value,
                      maximumHp: player.getMaximumHp()!.value,
                    ),
                    StatListWidget(player: player),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 10,
                      children: player.statusImpairmentList
                          .map((e) => SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: Image.asset(
                                  e.imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
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
