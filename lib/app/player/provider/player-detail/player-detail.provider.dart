import 'dart:convert';

import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/player/entity/player.entity.dart';
import 'package:cokc/app/player/model/update-player.model.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.state.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerDetailProvider =
    StateNotifierProvider.autoDispose((ref) => PlayerDetailProvider(
          playerService: ref.read(playerServiceProvider),
          configService: ref.read(configServiceProvider),
        ));

class PlayerDetailProvider extends StateNotifier<PlayerDetailState> {
  PlayerBaseService playerService;
  ConfigBaseService configService;

  PlayerDetailProvider({
    required this.playerService,
    required this.configService,
  }) : super(PlayerDetailInitialState());

  void setPlayerDetail(PlayerEntity playerEntity) {
    try {
      state = PlayerDetailLoadingState();
      state = PlayerDetailLoadedState(playerEntity: playerEntity);
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
        playerEntity: playerDetail,
        statConfigList: statConfigList,
      );
    } catch (e) {
      state = PlayerDetailErrorState(message: e.toString());
    }
  }

  Future updatePlayerDetail(UpdatePlayerModel model) async {
    try {
      state = PlayerDetailLoadingState();
      final updatedDetail = await playerService.updatePlayer(model);
      state = PlayerDetailLoadedState(playerEntity: updatedDetail);
    } catch (e) {
      state = PlayerDetailErrorState(message: e.toString());
    }
  }
}
