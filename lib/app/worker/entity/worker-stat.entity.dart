import 'package:equatable/equatable.dart';

class WorkerStatEntity extends Equatable {
  final int move;
  final int gather;
  final int scavenge;

  const WorkerStatEntity({
    required this.move,
    required this.gather,
    required this.scavenge,
  });

  @override
  List<Object?> get props => [
        move,
        gather,
        scavenge,
      ];

  @override
  bool? get stringify => true;
}
