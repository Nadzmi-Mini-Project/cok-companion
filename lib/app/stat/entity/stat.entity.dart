import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:equatable/equatable.dart';

class StatEntity extends Equatable {
  final StatCode code;
  final int value;

  const StatEntity({
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [
        code,
        value,
      ];

  @override
  bool? get stringify => true;
}
