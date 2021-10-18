import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
  final String id;
  final String code;
  final String value;

  const ConfigEntity({
    required this.id,
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        value,
      ];

  @override
  bool? get stringify => true;
}
