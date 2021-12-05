import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/session/model/session.model.dart';

abstract class PlayerState {}

class PlayerInitialState extends PlayerState {}

class PlayerLoadingState extends PlayerState {}

class PlayerLoadedState extends PlayerState {
  final SessionModel session;
  final List<CharacterModel> characterList;
  final bool isAddPlayerEnabled;

  PlayerLoadedState({
    required this.session,
    required this.characterList,
    required this.isAddPlayerEnabled,
  });
}

class PlayerErrorState extends PlayerState {
  final String message;

  PlayerErrorState({required this.message});
}
