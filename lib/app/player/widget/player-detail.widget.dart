import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/stat/widget/hp-bar.widget.dart';
import 'package:cokc/app/stat/widget/stat-form-list.widget.dart';
import 'package:cokc/app/stat/widget/stat-list.widget.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerDetailWidget extends ConsumerStatefulWidget {
  final PlayerModel playerModel;

  const PlayerDetailWidget({
    required this.playerModel,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerDetailWidgetState createState() => _PlayerDetailWidgetState();
}

class _PlayerDetailWidgetState extends ConsumerState<PlayerDetailWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(playerDetailProvider.notifier).setPlayerDetail(widget.playerModel);
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
      return _view(state.playerModel);
    } else if (state is PlayerDetailUpdateState) {
      return _formView(state.playerModel, state.statConfigList);
    } else if (state is PlayerDetailLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(
      child: Text('Player data not exist.'),
    );
  }

  Widget _view(PlayerModel model) {
    return Column(
      children: [
        Image.asset(model.character.imagePath),
        Text(model.character.name),
        HpBarWidget(
          currentHp: model.getCurrentHp()!.value,
          maximumHp: model.getMaximumHp()!.value,
        ),
        Expanded(child: StatListWidget(model: model)),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Level Up'),
            onPressed: () {
              // TODO: show update form
              ref.read(playerDetailProvider.notifier).showUpdateForm(model.id);
            },
          ),
        ),
      ],
    );
  }

  Widget _formView(
    PlayerModel model,
    List<StatConfigModel> configModelList,
  ) {
    // TODO: update form
    return Column(
      children: [
        Image.asset(model.character.imagePath),
        Text(model.character.name),
        Expanded(
          child: StatListFormWidget(
            model: model,
            configModelList: configModelList,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  // TODO: update player detail
                  ref.read(playerDetailProvider.notifier).updatePlayerDetail(
                      widget.playerModel); // TODO: simulate using real data
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  ref
                      .read(playerDetailProvider.notifier)
                      .setPlayerDetail(widget.playerModel);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
