import 'package:equatable/equatable.dart';

class PlayerStatEntity extends Equatable {
  final int maximumHp;
  final int currentHp;
  final int attack;
  final int heal;
  final int range;
  final int move;
  final int luck;

  const PlayerStatEntity({
    required this.maximumHp,
    required this.currentHp,
    required this.attack,
    required this.heal,
    required this.range,
    required this.move,
    required this.luck,
  });

  @override
  List<Object?> get props => [
        maximumHp,
        currentHp,
        attack,
        heal,
        range,
        move,
        luck,
      ];

  @override
  bool? get stringify => true;
}
