import 'package:cokc/app/character/service/character-base.service.dart';
import 'package:cokc/app/player/model/create-player.model.dart';
import 'package:cokc/app/player/provider/player/player.state.dart';
import 'package:cokc/app/player/service/player-base.service.dart';
import 'package:cokc/app/session/service/session-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider =
    StateNotifierProvider.autoDispose((ref) => PlayerProvider(
          playerService: ref.read(playerServiceProvider),
          characterService: ref.read(characterServiceProvider),
          sessionService: ref.read(sessionServiceProvider),
        ));

class PlayerProvider extends StateNotifier<PlayerState> {
  PlayerBaseService playerService;
  CharacterBaseService characterService;
  SessionBaseService sessionService;

  PlayerProvider({
    required this.playerService,
    required this.characterService,
    required this.sessionService,
  }) : super(PlayerInitialState());

  Future getPlayerList() async {
    try {
      state = PlayerLoadingState();
      final characterList = await characterService.getCharacterList();
      final curSession = await sessionService.getCurrentSession();

      state = PlayerLoadedState(
        characterList: characterList,
        session: curSession,
        isAddPlayerEnabled: (curSession.playerList.length < 4),
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future addPlayer(CreatePlayerModel model) async {
    try {
      state = PlayerLoadingState();

      await playerService.createPlayer(model);
      final characterList = await characterService.getCharacterList();
      final curSession = await sessionService.getCurrentSession();

      state = PlayerLoadedState(
        characterList: characterList,
        session: curSession,
        isAddPlayerEnabled: (curSession.playerList.length < 4),
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }

  Future clearSession() async {
    try {
      state = PlayerLoadingState();
      await sessionService.resetSession();
      final characterList = await characterService.getCharacterList();
      final curSession = await sessionService.getCurrentSession();

      state = PlayerLoadedState(
        characterList: characterList,
        session: curSession,
        isAddPlayerEnabled: (curSession.playerList.length < 4),
      );
    } catch (e) {
      state = PlayerErrorState(message: e.toString());
    }
  }
}
