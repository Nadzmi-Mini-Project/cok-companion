import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/app/worker/enum/worker-code.enum.dart';
import 'package:cokc/app/worker/enum/worker-color.enum.dart';
import 'package:equatable/equatable.dart';

class WorkerModel extends Equatable {
  final String id;
  final WorkerCode code;
  final WorkerColor color;
  final String imagePath;
  final List<ResourceModel> resourceList;

  const WorkerModel({
    required this.id,
    required this.code,
    required this.color,
    required this.imagePath,
    this.resourceList = const [],
  });

  @override
  List<Object?> get props => [
        id,
        code,
        color,
        imagePath,
        resourceList,
      ];

  @override
  bool? get stringify => true;
}
