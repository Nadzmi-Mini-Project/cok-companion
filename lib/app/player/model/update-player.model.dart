import 'package:equatable/equatable.dart';

class UpdatePlayerModel extends Equatable {
  final int playerMaximumHp;
  final int playerCurrentHp;
  final int playerAttack;
  final int playerHeal;
  final int playerRange;
  final int playerMove;
  final int playerLuck;

  const UpdatePlayerModel({
    required this.playerMaximumHp,
    required this.playerCurrentHp,
    required this.playerAttack,
    required this.playerHeal,
    required this.playerRange,
    required this.playerMove,
    required this.playerLuck,
  });

  @override
  List<Object?> get props => [
        playerMaximumHp,
        playerCurrentHp,
        playerAttack,
        playerHeal,
        playerRange,
        playerMove,
        playerLuck,
      ];

  @override
  bool? get stringify => true;
}
