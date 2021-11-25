import 'package:cokc/app/config/model/stat-progression-config.model.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:equatable/equatable.dart';

class StatConfigModel extends Equatable {
  final StatCode code;
  final int minimumPoint;
  final int maximumPoint;
  final List<StatProgressionConfigModel> progressionConfigList;

  const StatConfigModel({
    required this.code,
    required this.minimumPoint,
    required this.maximumPoint,
    required this.progressionConfigList,
  });

  @override
  List<Object?> get props => [
        code,
        minimumPoint,
        maximumPoint,
        progressionConfigList,
      ];

  @override
  bool? get stringify => true;

  StatProgressionConfigModel? getProgression(int point) =>
      progressionConfigList.firstWhere((element) => element.point == point);
}
