import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/player/entity/player.entity.dart';

abstract class PlayerState {}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerLoadedState extends PlayerState {
  final List<PlayerEntity> playerList;
  final List<CharacterEntity> characterList;

  PlayerLoadedState({
    required this.playerList,
    required this.characterList,
  });
}

class PlayerErrorState extends PlayerState {
  final String message;

  PlayerErrorState({required this.message});
}
