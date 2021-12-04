import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:equatable/equatable.dart';

class ResourceModel extends Equatable {
  final String id;
  final ResourceCode code;
  final String name;
  final String imagePath;

  const ResourceModel({
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
