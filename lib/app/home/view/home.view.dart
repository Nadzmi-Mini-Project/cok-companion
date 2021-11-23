import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/character/widget/character-summary.widget.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
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
              ? _view(
                  playerState.playerList,
                  playerState.characterList,
                  playerState.isAddPlayerEnabled,
                )
              : const Center(
                  child: Text('No player added.'),
                ),
    );
  }

  Widget _view(
    List<PlayerModel> playerList,
    List<CharacterModel> characterList,
    bool isAddPlayerEnabled,
  ) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: playerList.length,
              itemBuilder: (context, index) => PlayerSummaryWidget(
                player: playerList[index],
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        PlayerDetailWidget(player: playerList[index]),
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
            onPressed: !isAddPlayerEnabled
                ? null
                : () {
                    showModalBottomSheet(
                      context: context,
                      // isScrollControlled: true,
                      builder: (context) => ListView.builder(
                        itemCount: characterList.length,
                        itemBuilder: (context, index) => CharacterSummaryWidget(
                          character: characterList[index],
                          onTap: () {
                            ref.read(playerProvider.notifier).addPlayer(
                                  CreatePlayerModel(
                                    id: '1',
                                    characterId: characterList[index].id,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        ),
                      ),
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
