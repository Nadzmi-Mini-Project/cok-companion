import 'package:equatable/equatable.dart';

class ConfigModel extends Equatable {
  final String id;
  final String code;
  final String value;

  const ConfigModel({
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
