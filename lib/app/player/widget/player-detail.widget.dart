import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/old-barn/provider/old-barn.provider.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/player/widget/player-summary.widget.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/app/stat/model/stat.model.dart';
import 'package:cokc/app/status-impairment/model/status-impairment.model.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerDetailWidget extends ConsumerStatefulWidget {
  final String playerId;

  const PlayerDetailWidget({
    Key? key,
    required this.playerId,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerDetailWidgetState();
}

class _PlayerDetailWidgetState extends ConsumerState<PlayerDetailWidget> {
  final List<bool> _workerIsExpanded = [false, false];
  bool _impairmentIsExpanded = false;

  @override
  void initState() {
    super.initState();
    ref.read(playerDetailProvider.notifier).getPlayer(widget.playerId);
  }

  @override
  Widget build(BuildContext context) {
    var playerDetailState = ref.watch(playerDetailProvider);

    ref.listen(playerDetailProvider, (state) {
      if (state is ErrorPlayerDetailState) {
        showErrorDialog(context, state.message);
      }
    });

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .padding
                .top),
        color: Colors.white,
        child: (playerDetailState is LoadingPlayerDetailState)
            ? const Center(child: CircularProgressIndicator())
            : (playerDetailState is LoadedPlayerDetailState)
                ? _view(
                    playerDetailState.player,
                    playerDetailState.statConfigList,
                    playerDetailState.resourceList,
                    playerDetailState.impairmentList,
                  )
                : const Center(child: Text('No player data available.')),
      ),
    );
  }

  Widget _view(
    PlayerModel player,
    List<StatConfigModel> statConfigList,
    List<ResourceModel> resourceList,
    List<StatusImpairmentModel> impairmentList,
  ) {
    return Column(
      children: [
        PlayerSummaryWidget(player: player),
        Expanded(
          child: ListView(
            children: [
              _workerView(player, resourceList),
              _impairmentView(player, impairmentList),
              _statView(player, statConfigList),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    ref
                        .read(playerDetailProvider.notifier)
                        .savePlayerDetail(player.id);
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: const Text('Remove Player'),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Remove Player'),
                      content:
                          const Text('Are you sure to remove this player?'),
                      actions: [
                        TextButton(
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onPressed: () async {
                            await ref
                                .read(playerDetailProvider.notifier)
                                .removePlayer(player.id);
                            Navigator.popUntil(
                                context, ModalRoute.withName('/'));
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _workerView(PlayerModel player, List<ResourceModel> resourceList) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) => setState(() {
        _workerIsExpanded[panelIndex] = !isExpanded;
      }),
      children: player.workerList
          .map((e) => _workerFormWidget(
                _workerIsExpanded[player.workerList.indexOf(e)],
                player,
                e,
                resourceList,
              ))
          .toList(),
    );
  }

  ExpansionPanelList _impairmentView(
    PlayerModel player,
    List<StatusImpairmentModel> impairmentList,
  ) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) => setState(() {
        _impairmentIsExpanded = !isExpanded;
      }),
      children: [
        ExpansionPanel(
          isExpanded: _impairmentIsExpanded,
          headerBuilder: (context, isExpanded) => ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    const Text('Impairments'),
                    Expanded(
                      child: Wrap(
                        children: player.statusImpairmentList
                            .map((e) => InkWell(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: Image.asset(
                                      e.imagePath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  onTap: () {
                                    ref
                                        .read(playerDetailProvider.notifier)
                                        .removeStatusImpairment(player.id, e);
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Wrap(
            children: impairmentList
                .map((e) => InkWell(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: Image.asset(
                          e.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                      onTap: () {
                        ref
                            .read(playerDetailProvider.notifier)
                            .addStatusImpairment(player.id, e);
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _statView(
    PlayerModel player,
    List<StatConfigModel> statConfigList,
  ) {
    final curHpStatConfig = statConfigList
        .firstWhere((element) => element.code == StatCode.currentHp);

    return SingleChildScrollView(
      child: Wrap(
        children: [
          // max hp
          _statFormWidget(
            'asset/icon/stat/max-hp.png',
            player.getMaximumHp()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.maximumHp),
            true,
            player.id,
          ),

          // cur hp
          _statFormWidget(
            'asset/icon/stat/cur-hp.png',
            player.getCurrentHp()!,
            StatConfigModel(
              code: curHpStatConfig.code,
              minimumPoint: curHpStatConfig.minimumPoint,
              maximumPoint: player.getMaximumHp()!.point,
              progressionConfigList: curHpStatConfig.progressionConfigList,
            ),
            true,
            player.id,
          ),

          // attack
          _statFormWidget(
            'asset/icon/stat/attack.png',
            player.getAttack()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.attack),
            true,
            player.id,
          ),

          // heal
          _statFormWidget(
            'asset/icon/stat/heal.png',
            player.getHeal()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.heal),
            true,
            player.id,
          ),

          // range
          _statFormWidget(
            'asset/icon/stat/range.png',
            player.getRange()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.range),
            true,
            player.id,
          ),

          // player move
          _statFormWidget(
            'asset/icon/stat/player-move.png',
            player.getPlayerMove()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.playerMove),
            true,
            player.id,
          ),

          // luck
          _statFormWidget(
            'asset/icon/stat/luck.png',
            player.getLuck()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.luck),
            true,
            player.id,
          ),

          // worker move
          _statFormWidget(
            'asset/icon/stat/worker-move.png',
            player.getWorkerMove()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.workerMove),
            false,
            player.id,
          ),

          // gather
          _statFormWidget(
            'asset/icon/stat/gather.png',
            player.getGather()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.gather),
            false,
            player.id,
          ),

          // scavenge
          _statFormWidget(
            'asset/icon/stat/scavenge.png',
            player.getScavenge()!,
            statConfigList
                .firstWhere((element) => element.code == StatCode.scavenge),
            false,
            player.id,
          ),
        ],
      ),
    );
  }

  ExpansionPanel _workerFormWidget(
    bool isExpanded,
    PlayerModel player,
    WorkerModel worker,
    List<ResourceModel> resourceList,
  ) {
    return ExpansionPanel(
      isExpanded: isExpanded,
      headerBuilder: (context, isExpanded) => ListTile(
        title: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Image.asset(
                    worker.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                (worker.resourceList.isEmpty)
                    ? const Text('Resource empty')
                    : Container(
                        color: Colors.black26,
                        padding: const EdgeInsets.all(5),
                        child: Wrap(
                          children: worker.resourceList
                              .map((e) => InkWell(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: Image.asset(
                                        e.imagePath,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    onTap: () {
                                      ref
                                          .read(playerDetailProvider.notifier)
                                          .removeResource(
                                              player.id, worker.id, e);
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
              ],
            ),
            !isExpanded
                ? const SizedBox.shrink()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Transfer'),
                      onPressed: (worker.resourceList.isEmpty)
                          ? null
                          : () {
                              ref
                                  .read(oldBarnProvider.notifier)
                                  .transferResource(player.id, worker);
                            },
                    ),
                  ),
          ],
        ),
      ),
      body: Wrap(
        children: resourceList
            .map((e) => InkWell(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Image.asset(
                      e.imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(playerDetailProvider.notifier)
                        .addResource(player.id, worker.id, e);
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _statFormWidget(
    String imagePath,
    StatModel stat,
    StatConfigModel config,
    bool isPlayerStat,
    String playerId,
  ) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          Column(
            children: [
              ActionChip(
                label: const Icon(Icons.add),
                shape: const CircleBorder(),
                onPressed: () {
                  final statPoint = stat.point + 1;

                  ref.read(playerDetailProvider.notifier).updateStat(
                        playerId,
                        config.code,
                        statPoint,
                        isPlayerStat,
                      );
                },
              ),
              ActionChip(
                label: const Icon(Icons.remove),
                shape: const CircleBorder(),
                onPressed: () {
                  final statPoint = stat.point - 1;

                  ref.read(playerDetailProvider.notifier).updateStat(
                        playerId,
                        config.code,
                        statPoint,
                        isPlayerStat,
                      );
                },
              ),
            ],
          ),
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Text(
                'Point: ${stat.point.toString()}',
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
              Text(
                'Value: ${stat.value.toString()}',
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
