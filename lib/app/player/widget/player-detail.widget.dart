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
  final PlayerModel player;

  const PlayerDetailWidget({
    required this.player,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerDetailWidgetState createState() => _PlayerDetailWidgetState();
}

class _PlayerDetailWidgetState extends ConsumerState<PlayerDetailWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(playerDetailProvider.notifier).setPlayerDetail(widget.player);
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
      return _view(state.player);
    } else if (state is PlayerDetailUpdateState) {
      return _formView(state.player, state.statConfigList);
    } else if (state is PlayerDetailLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(
      child: Text('Player data not exist.'),
    );
  }

  Widget _view(PlayerModel player) {
    return Column(
      children: [
        Image.asset(player.character.imagePath),
        Text(player.character.name),
        HpBarWidget(
          currentHp: player.getCurrentHp()!.value,
          maximumHp: player.getMaximumHp()!.value,
        ),
        Expanded(child: StatListWidget(player: player)),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Level Up'),
            onPressed: () {
              ref.read(playerDetailProvider.notifier).showUpdateForm(player.id);
            },
          ),
        ),
      ],
    );
  }

  Widget _formView(
    PlayerModel player,
    List<StatConfigModel> configModelList,
  ) {
    return Column(
      children: [
        Image.asset(player.character.imagePath),
        Text(player.character.name),
        Expanded(
          child: StatListFormWidget(
            player: player,
            configModelList: configModelList,
          ),
        ),
      ],
    );
  }
}
