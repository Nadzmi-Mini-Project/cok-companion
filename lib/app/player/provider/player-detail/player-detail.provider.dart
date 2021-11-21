import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/player/provider/player/player.provider.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerDetailProvider =
    StateNotifierProvider.autoDispose((ref) => PlayerDetailProvider(
          playerProvider: ref.read(playerProvider.notifier),
          playerService: ref.read(playerServiceProvider),
          configService: ref.read(configServiceProvider),
        ));

class PlayerDetailProvider extends StateNotifier<PlayerDetailState> {
  PlayerProvider playerProvider;
  PlayerBaseService playerService;
  ConfigBaseService configService;

  PlayerDetailProvider({
    required this.playerProvider,
    required this.playerService,
    required this.configService,
  }) : super(PlayerDetailInitialState());

  void setPlayerDetail(PlayerModel model) {
    try {
      state = PlayerDetailLoadingState();
      state = PlayerDetailLoadedState(playerModel: model);
    } catch (e) {
      state = PlayerDetailErrorState(message: e.toString());
    }
  }

  Future showUpdateForm(String playerId) async {
    try {
      state = PlayerDetailLoadingState();
      final playerDetail = await playerService.getPlayerById(playerId);
      final statConfigList = await configService.getStatConfigList();
      state = PlayerDetailUpdateState(
        playerModel: playerDetail,
        statConfigList: statConfigList,
      );
    } catch (e) {
      state = PlayerDetailErrorState(message: e.toString());
    }
  }

  Future updatePlayerDetail(PlayerModel model) async {
    try {
      state = PlayerDetailLoadingState();
      final updatedPlayer = await playerService.updatePlayer(model);
      state = PlayerDetailLoadedState(playerModel: updatedPlayer);
      await playerProvider.getPlayerList();
    } catch (e) {
      state = PlayerDetailErrorState(message: e.toString());
    }
  }
}
