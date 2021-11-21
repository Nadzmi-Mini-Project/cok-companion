import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/model/player.model.dart';

abstract class PlayerDetailState {}

class PlayerDetailInitialState extends PlayerDetailState {}

class PlayerDetailLoadingState extends PlayerDetailState {}

class PlayerDetailErrorState extends PlayerDetailState {
  final String message;

  PlayerDetailErrorState({required this.message});
}

class PlayerDetailLoadedState extends PlayerDetailState {
  final PlayerModel player;

  PlayerDetailLoadedState({required this.player});
}

class PlayerDetailUpdateState extends PlayerDetailState {
  final PlayerModel player;
  final List<StatConfigModel> statConfigList;

  PlayerDetailUpdateState({
    required this.player,
    required this.statConfigList,
  });
}
