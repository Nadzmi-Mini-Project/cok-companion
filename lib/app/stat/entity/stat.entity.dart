import 'package:cokc/app/stat/enum/stat-type.enum.dart';
import 'package:equatable/equatable.dart';

class StatEntity extends Equatable {
  final StatType type;
  final int value;

  const StatEntity({
    required this.type,
    required this.value,
  });

  @override
  List<Object?> get props => [
        type,
        value,
      ];

  @override
  bool? get stringify => true;
}
