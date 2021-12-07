import 'package:equatable/equatable.dart';

class OldBarnModel extends Equatable {
  final int wood;
  final int ore;
  final int fish;
  final int linen;
  final int itemPart;

  const OldBarnModel({
    required this.wood,
    required this.ore,
    required this.fish,
    required this.linen,
    required this.itemPart,
  });

  @override
  List<Object?> get props => [
        wood,
        ore,
        fish,
        linen,
        itemPart,
      ];

  @override
  bool? get stringify => true;
}
