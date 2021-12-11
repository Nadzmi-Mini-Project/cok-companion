import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/resource/model/resource.model.dart';

abstract class OldBarnState {}

class OldBarnInitialState extends OldBarnState {}

class OldBarnLoadingState extends OldBarnState {}

class OldBarnLoadedState extends OldBarnState {
  final OldBarnModel oldBarn;
  final List<ResourceModel> resourceList;

  OldBarnLoadedState({
    required this.oldBarn,
    required this.resourceList,
  });
}

class OldBarnErrorState extends OldBarnState {
  final String message;

  OldBarnErrorState({required this.message});
}
