import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/player/model/player.model.dart';

abstract class PlayerState {}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerLoadedState extends PlayerState {
  final List<PlayerModel> playerList;
  final List<CharacterModel> characterList;
  final bool isAddPlayerEnabled;

  PlayerLoadedState({
    required this.playerList,
    required this.characterList,
    required this.isAddPlayerEnabled,
  });
}

class PlayerErrorState extends PlayerState {
  final String message;

  PlayerErrorState({required this.message});
}
