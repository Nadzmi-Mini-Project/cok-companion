import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/entity/player.entity.dart';

abstract class PlayerDetailState {}

class PlayerDetailInitialState extends PlayerDetailState {}

class PlayerDetailLoadingState extends PlayerDetailState {}

class PlayerDetailErrorState extends PlayerDetailState {
  final String message;

  PlayerDetailErrorState({required this.message});
}

class PlayerDetailLoadedState extends PlayerDetailState {
  final PlayerEntity playerEntity;

  PlayerDetailLoadedState({required this.playerEntity});
}

class PlayerDetailUpdateState extends PlayerDetailState {
  final PlayerEntity playerEntity;
  final List<StatConfigModel> statConfigList;

  PlayerDetailUpdateState({
    required this.playerEntity,
    required this.statConfigList,
  });
}
