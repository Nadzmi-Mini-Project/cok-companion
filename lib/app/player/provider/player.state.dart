import 'package:cokc/app/player/entity/player.entity.dart';

abstract class PlayerState {}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerLoadedState extends PlayerState {
  final List<PlayerEntity> playerList;

  PlayerLoadedState({required this.playerList});
}

class PlayerErrorState extends PlayerState {
  final String message;

  PlayerErrorState({required this.message});
}
