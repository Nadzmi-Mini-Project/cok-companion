import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/provider/player/player.state.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider =
    StateNotifierProvider.autoDispose((ref) => PlayerProvider(
          playerService: ref.read(playerServiceProvider),
        ));

class PlayerProvider extends StateNotifier<PlayerState> {
  PlayerBaseService playerService;

  PlayerProvider({
    required this.playerService,
  }) : super(PlayerInitialState());

  Future getPlayerList() async {
    try {
      state = PlayerLoadingState();
      final playerList = await playerService.getPlayerList();
      state = PlayerLoadedState(playerList: playerList);
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future addPlayer(CreatePlayerModel model) async {
    try {
      state = PlayerLoadingState();
      await playerService.createPlayer(model);
      final playerList = await playerService.getPlayerList();
      state = PlayerLoadedState(playerList: playerList);
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future clearSession() async {
    try {
      state = PlayerLoadingState();
      await playerService.removeAllPlayer();
      final playerList = await playerService.getPlayerList();
      state = PlayerLoadedState(playerList: playerList);
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }
}
