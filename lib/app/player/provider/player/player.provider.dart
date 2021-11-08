import 'package:cokc/app/character/service/character-base.service.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/provider/player/player.state.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider =
    StateNotifierProvider.autoDispose((ref) => PlayerProvider(
          playerService: ref.read(playerServiceProvider),
          characterService: ref.read(characterServiceProvider),
        ));

class PlayerProvider extends StateNotifier<PlayerState> {
  PlayerBaseService playerService;
  CharacterBaseService characterService;

  PlayerProvider({
    required this.playerService,
    required this.characterService,
  }) : super(PlayerInitialState());

  Future getPlayerList() async {
    try {
      state = PlayerLoadingState();
      final playerList = await playerService.getPlayerList();
      final characterList = await characterService.getCharacterList();
      state = PlayerLoadedState(
        playerList: playerList,
        characterList: characterList,
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future addPlayer(CreatePlayerModel model) async {
    try {
      state = PlayerLoadingState();
      await playerService.createPlayer(model);
      final playerList = await playerService.getPlayerList();
      final characterList = await characterService.getCharacterList();
      state = PlayerLoadedState(
        playerList: playerList,
        characterList: characterList,
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future clearSession() async {
    try {
      state = PlayerLoadingState();
      await playerService.removeAllPlayer();
      final playerList = await playerService.getPlayerList();
      final characterList = await characterService.getCharacterList();
      state = PlayerLoadedState(
        playerList: playerList,
        characterList: characterList,
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }
}
