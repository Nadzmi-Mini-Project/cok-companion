import 'package:cokc/app/old-barn/provider/old-barn.state.dart';
import 'package:cokc/app/old-barn/service/old-barn-base.service.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/worker/model/worker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oldBarnProvider = StateNotifierProvider.autoDispose(
    (ref) => OldBarnProvider(oldBarnService: ref.read(oldBarnServiceProvider)));

class OldBarnProvider extends StateNotifier<OldBarnState> {
  final OldBarnBaseService oldBarnService;

  OldBarnProvider({
    required this.oldBarnService,
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

  Future transferResource(WorkerModel worker) async {
    try {
      state = OldBarnLoadingState();

      for (ResourceModel resource in worker.resourceList) {
        await oldBarnService.addResource(resource, 1);
      }

      final updatedOldBarn = await oldBarnService.get();

      state = OldBarnLoadedState(oldBarn: updatedOldBarn);
    } catch (e) {
      state = OldBarnErrorState(message: e.toString());
    }
  }
}
