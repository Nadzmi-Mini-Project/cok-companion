import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:equatable/equatable.dart';

class StatModel extends Equatable {
  final StatCode code;
  final int point;
  final int value;

  const StatModel({
    required this.code,
    required this.point,
    required this.value,
  });

  @override
  List<Object?> get props => [
        code,
        point,
        value,
      ];

  @override
  bool? get stringify => true;
}
