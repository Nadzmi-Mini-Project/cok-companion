import 'package:cokc/app/old-barn/provider/old-barn.state.dart';
import 'package:cokc/app/old-barn/service/old-barn-base.service.dart';
import 'package:cokc/app/player/provider/player-detail/player-detail.provider.dart';
import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/resource/service/resource-base.service.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:cokc/app/worker/service/worker-base.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oldBarnProvider =
    StateNotifierProvider.autoDispose((ref) => OldBarnProvider(
          oldBarnService: ref.read(oldBarnServiceProvider),
          resourceService: ref.read(resourceServiceProvider),
          workerService: ref.read(workerServiceProvider),
          playerDetailProvider: ref.read(playerDetailProvider.notifier),
        ));

class OldBarnProvider extends StateNotifier<OldBarnState> {
  final OldBarnBaseService oldBarnService;
  final ResourceBaseService resourceService;
  final WorkerBaseService workerService;
  final PlayerDetailProvider playerDetailProvider;

  OldBarnProvider({
    required this.oldBarnService,
    required this.resourceService,
    required this.workerService,
    required this.playerDetailProvider,
  }) : super(OldBarnInitialState());

  Future getOldBarn() async {
    try {
      state = OldBarnLoadingState();

      final oldBarn = await oldBarnService.get();
      final resourcelist = await resourceService.getAll();

      state = OldBarnLoadedState(
        oldBarn: oldBarn,
        resourceList: resourcelist,
      );
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

      final oldBarn = await oldBarnService.get();
      final resourcelist = await resourceService.getAll();

      state = OldBarnLoadedState(
        oldBarn: oldBarn,
        resourceList: resourcelist,
      );
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }

  Future addResource(ResourceCode code) async {
    try {
      state = OldBarnLoadingState();

      final resource = await resourceService.getByCode(code);
      await oldBarnService.addResource(resource, 1);

      final oldBarn = await oldBarnService.get();
      final resourcelist = await resourceService.getAll();

      state = OldBarnLoadedState(
        oldBarn: oldBarn,
        resourceList: resourcelist,
      );
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }

  Future removeResource(ResourceCode code) async {
    try {
      state = OldBarnLoadingState();

      final resource = await resourceService.getByCode(code);
      await oldBarnService.removeResource(resource, 1);

      final oldBarn = await oldBarnService.get();
      final resourcelist = await resourceService.getAll();

      state = OldBarnLoadedState(
        oldBarn: oldBarn,
        resourceList: resourcelist,
      );
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }
}
