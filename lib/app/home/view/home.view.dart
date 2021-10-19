import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/provider/player/player.provider.dart';
import 'package:cokc/app/player/provider/player/player.state.dart';
import 'package:cokc/app/player/widget/player-detail.widget.dart';
import 'package:cokc/app/player/widget/player-summary.widget.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(playerProvider.notifier).getPlayerList();
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerProvider);

    ref.listen(playerProvider, (state) {
      if (state is PlayerErrorState) {
        showErrorDialog(context, state.message);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: (playerState is PlayerLoadingState)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (playerState is PlayerLoadedState)
              ? _view(playerState.playerList)
              : const Center(
                  child: Text('No player added.'),
                ),
    );
  }

  Widget _view(List<PlayerEntity> playerList) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: playerList.length,
              itemBuilder: (context, index) => PlayerSummaryWidget(
                playerEntity: playerList[index],
                onTap: () {
                  // TODO: show detail widget
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        PlayerDetailWidget(playerEntity: playerList[index]),
                  );
                },
              ),
            ),
            onRefresh: () async {
              ref.read(playerProvider.notifier).getPlayerList();
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Add Player'),
            onPressed: () {
              // TODO: add player function
              ref.read(playerProvider.notifier).addPlayer(
                    const CreatePlayerModel(id: '1', characterId: '1'),
                  );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Reset Session'),
            onPressed: () {
              ref.read(playerProvider.notifier).clearSession();
            },
          ),
        ),
      ],
    );
  }
}
