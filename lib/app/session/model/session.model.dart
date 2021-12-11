import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/player/model/player.model.dart';
import 'package:equatable/equatable.dart';

class SessionModel extends Equatable {
  final String id;
  final List<PlayerModel> playerList;
  final OldBarnModel oldBarn;

  const SessionModel({
    required this.id,
    required this.playerList,
    required this.oldBarn,
  });

  @override
  List<Object?> get props => [
        id,
        playerList,
        oldBarn,
      ];

  @override
  bool? get stringify => true;
}
