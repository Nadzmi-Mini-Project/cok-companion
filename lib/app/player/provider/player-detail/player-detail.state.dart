import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:cokc/app/resource/model/resource.model.dart';

abstract class PlayerDetailState {}

class InitialPlayerDetailState extends PlayerDetailState {}

class LoadingPlayerDetailState extends PlayerDetailState {}

class ErrorPlayerDetailState extends PlayerDetailState {
  final String message;

  ErrorPlayerDetailState({required this.message});
}

class LoadedPlayerDetailState extends PlayerDetailState {
  final List<StatConfigModel> statConfigList;
  final List<ResourceModel> resourceList;
  final PlayerModel player;

  LoadedPlayerDetailState({
    required this.statConfigList,
    required this.resourceList,
    required this.player,
  });
}
