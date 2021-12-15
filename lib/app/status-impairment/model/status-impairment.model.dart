import 'package:cokc/app/status-impairment/enum/impairment-code.enum.dart';
import 'package:equatable/equatable.dart';

class StatusImpairmentModel extends Equatable {
  final String id;
  final ImpairmentCode code;
  final String name;
  final String imagePath;

  const StatusImpairmentModel({
    required this.id,
    required this.code,
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        imagePath,
      ];

  @override
  bool? get stringify => true;
}
