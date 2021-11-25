import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/player/widget/player-summary.widget.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/app/stat/widget/stat-counter.widget.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatListFormWidget extends ConsumerStatefulWidget {
  final String playerId;

  const StatListFormWidget({
    Key? key,
    required this.playerId,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StatListFormWidgetState();
}

class _StatListFormWidgetState extends ConsumerState<StatListFormWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(playerDetailProvider.notifier).getPlayer(widget.playerId);
  }

  @override
  Widget build(BuildContext context) {
    final playerDetailState = ref.watch(playerDetailProvider);

    ref.listen(playerDetailProvider, (state) {
      if (state is ErrorPlayerDetailState) {
        showErrorDialog(context, state.message);
      }
    });

    return (playerDetailState is LoadingPlayerDetailState)
        ? const Center(child: CircularProgressIndicator())
        : (playerDetailState is LoadedPlayerDetailState)
            ? _view(
                playerDetailState.player,
                playerDetailState.statConfigList,
              )
            : const Center(child: Text('No player data available.'));
  }

  Widget _view(PlayerModel player, List<StatConfigModel> statConfigList) {
    final maxHpConfig = statConfigList
        .firstWhere((element) => element.code == StatCode.maximumHp);

    return Column(
      children: [
        PlayerSummaryWidget(player: player),
        Expanded(
          child: ListView(
            children: [
              // max hp
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getMaximumHp()!.value,
                maxHpConfig,
                true,
                player.id,
              ),

              // cur hp
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getCurrentHp()!.value,
                StatConfigModel(
                  code: StatCode.currentHp,
                  minimumPoint: 0,
                  maximumPoint: player.getMaximumHp()!.value,
                  progressionConfigList: maxHpConfig.progressionConfigList,
                ),
                true,
                player.id,
              ),

              // attack
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getAttack()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.attack),
                true,
                player.id,
              ),

              // heal
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getHeal()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.heal),
                true,
                player.id,
              ),

              // range
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getRange()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.range),
                true,
                player.id,
              ),

              // player move
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getPlayerMove()!.value,
                statConfigList.firstWhere(
                    (element) => element.code == StatCode.playerMove),
                true,
                player.id,
              ),

              // luck
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getLuck()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.luck),
                true,
                player.id,
              ),

              // worker move
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getWorkerMove()!.value,
                statConfigList.firstWhere(
                    (element) => element.code == StatCode.workerMove),
                false,
                player.id,
              ),

              // gather
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getGather()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.gather),
                false,
                player.id,
              ),

              // scavenge
              _statFormWidget(
                'asset/image/character/sample-icon.jpg', // TODO: use correct icon
                player.getScavenge()!.value,
                statConfigList
                    .firstWhere((element) => element.code == StatCode.scavenge),
                false,
                player.id,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statFormWidget(
    String imagePath,
    int value,
    StatConfigModel config,
    bool isPlayerStat,
    String playerId,
  ) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Row(children: [const Text('Point:'), Text(value.toString())]),
                Row(children: [const Text('Value:'), Text(value.toString())]),
              ],
            ),
          ],
        ),
        StatCounterWidget(
          minimum: config.minimumPoint,
          maximum: config.maximumPoint,
          value: value,
          onChange: (value) {
            ref.read(playerDetailProvider.notifier).updateStat(
                  playerId,
                  StatModel(
                    code: config.code,
                    point: value,
                    value: value, // TODO: use correct value for point
                  ),
                  isPlayerStat,
                );
          },
        ),
      ],
    );
  }
}
