import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerDetailWidget extends ConsumerStatefulWidget {
  final PlayerEntity playerEntity;

  const PlayerDetailWidget({
    required this.playerEntity,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerDetailWidgetState createState() => _PlayerDetailWidgetState();
}

class _PlayerDetailWidgetState extends ConsumerState<PlayerDetailWidget> {
  @override
  void initState() {
    super.initState();
    ref
        .read(playerDetailProvider.notifier)
        .setPlayerDetail(widget.playerEntity);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(playerDetailProvider);

    ref.listen(playerDetailProvider, (state) {
      if (state is PlayerDetailErrorState) {
        showErrorDialog(context, state.message);
      }
    });

    if (state is PlayerDetailLoadedState) {
      return _view(state.playerEntity);
    } else if (state is PlayerDetailUpdateState) {
      return _formView(state.playerEntity);
    } else if (state is PlayerDetailLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(
      child: Text('Player data not exist.'),
    );
  }

  Widget _view(PlayerEntity playerEntity) {
    return Column(
      children: [
        Image.asset(playerEntity.characterEntity.imagePath),
        Text(playerEntity.characterEntity.name),
        HpBarWidget(
          currentHp: playerEntity.getCurrentHp()!.value,
          maximumHp: playerEntity.getMaximumHp()!.value,
        ),
        Expanded(child: StatListWidget(playerEntity: playerEntity)),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Level Up'),
            onPressed: () {
              // TODO: show update form
              ref
                  .read(playerDetailProvider.notifier)
                  .showUpdateForm(playerEntity.id);
            },
          ),
        ),
      ],
    );
  }

  Widget _formView(PlayerEntity playerEntity) {
    // TODO: update form
    return Column(
      children: [
        Image.asset(playerEntity.characterEntity.imagePath),
        Text(playerEntity.characterEntity.name),
        Wrap(
          children: [
            // TODO: show list of stat form
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  // TODO: update player detail
                  ref.read(playerDetailProvider.notifier).updatePlayerDetail(
                      widget.playerEntity); // TODO: simulate using real data
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  ref
                      .read(playerDetailProvider.notifier)
                      .setPlayerDetail(widget.playerEntity);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
