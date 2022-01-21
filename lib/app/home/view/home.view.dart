import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/character/widget/character-summary.widget.dart';
import 'package:cokc/app/old-barn/widget/old-barn.widget.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player/player.provider.dart';
import 'package:cokc/app/player/provider/player/player.state.dart';
import 'package:cokc/app/player/widget/player-summary.widget.dart';
import 'package:cokc/app/player/widget/player-detail.widget.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: () => ref.read(playerProvider.notifier).clearSession(),
          ),
        ],
      ),
      floatingActionButton: (playerState is PlayerLoadedState)
          ? Visibility(
              visible: playerState.isAddPlayerEnabled,
              child: FloatingActionButton.extended(
                label: const Text("Add Player"),
                icon: const Icon(Icons.add),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => ListView.builder(
                    itemCount: playerState.characterList.length,
                    itemBuilder: (context, index) => CharacterSummaryWidget(
                      character: playerState.characterList[index],
                      onTap: () {
                        ref.read(playerProvider.notifier).addPlayer(
                              CreatePlayerModel(
                                characterId:
                                    playerState.characterList[index].id,
                              ),
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: (playerState is PlayerLoadingState)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : (playerState is PlayerLoadedState)
                ? _view(
                    playerState.session.playerList,
                    playerState.characterList,
                    playerState.isAddPlayerEnabled,
                  )
                : const Center(
                    child: Text('No player added.'),
                  ),
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
        // old barn
        const OldBarnWidget(),

        // player list
        Expanded(
          child: RefreshIndicator(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: playerList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  bottom:
                      ((index == playerList.length - 1) && isAddPlayerEnabled)
                          ? 100
                          : 0,
                ),
                child: PlayerSummaryWidget(
                  player: playerList[index],
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => PlayerDetailWidget(
                        playerId: playerList[index].id,
                      ),
                    );
                  },
                ),
              ),
            ),
            onRefresh: () async {
              ref.read(playerProvider.notifier).getPlayerList();
            },
          ),
        ),
      ],
    );
  }
}
