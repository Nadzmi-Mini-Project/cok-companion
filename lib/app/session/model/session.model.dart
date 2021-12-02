import 'package:cokc/app/player/model/player.model.dart';
import 'package:equatable/equatable.dart';

class SessionModel extends Equatable {
  final String id;
  final List<PlayerModel> playerList;

  const SessionModel({
    required this.id,
    required this.playerList,
  });

  @override
  List<Object?> get props => [
        id,
        playerList,
      ];

  @override
  bool? get stringify => true;
}
