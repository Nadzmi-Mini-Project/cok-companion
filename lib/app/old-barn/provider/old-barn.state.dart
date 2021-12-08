import 'package:cokc/app/old-barn/model/old-barn.model.dart';

abstract class OldBarnState {}

class OldBarnInitialState extends OldBarnState {}

class OldBarnLoadingState extends OldBarnState {}

class OldBarnLoadedState extends OldBarnState {
  final OldBarnModel oldBarn;

  OldBarnLoadedState({required this.oldBarn});
}

class OldBarnErrorState extends OldBarnState {
  final String message;

  OldBarnErrorState({required this.message});
}
