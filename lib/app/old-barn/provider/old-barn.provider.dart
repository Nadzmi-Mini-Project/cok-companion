import 'package:cokc/app/old-barn/provider/old-barn.state.dart';
import 'package:cokc/app/old-barn/service/old-barn-base.service.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/app/worker/service/worker-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oldBarnProvider =
    StateNotifierProvider.autoDispose((ref) => OldBarnProvider(
          oldBarnService: ref.read(oldBarnServiceProvider),
          workerService: ref.read(workerServiceProvider),
          playerDetailProvider: ref.read(playerDetailProvider.notifier),
        ));

class OldBarnProvider extends StateNotifier<OldBarnState> {
  final OldBarnBaseService oldBarnService;
  final WorkerBaseService workerService;
  final PlayerDetailProvider playerDetailProvider;

  OldBarnProvider({
    required this.oldBarnService,
    required this.workerService,
    required this.playerDetailProvider,
  }) : super(OldBarnInitialState());

  Future getOldBarn() async {
    try {
      state = OldBarnLoadingState();

      final oldBarn = await oldBarnService.get();

      state = OldBarnLoadedState(oldBarn: oldBarn);
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }

  Future transferResource(String playerId, WorkerModel worker) async {
    try {
      state = OldBarnLoadingState();

      for (ResourceModel resource in worker.resourceList) {
        await oldBarnService.addResource(resource, 1);
      }
      await workerService.clearResource(playerId, worker.id);
      await playerDetailProvider.getPlayer(playerId);

      final updatedOldBarn = await oldBarnService.get();

      state = OldBarnLoadedState(oldBarn: updatedOldBarn);
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }
}
