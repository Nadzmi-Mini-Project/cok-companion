import 'package:equatable/equatable.dart';

class StatProgressionConfigModel extends Equatable {
  final int point;
  final int value;

  const StatProgressionConfigModel({required this.point, required this.value});

  @override
  List<Object?> get props => [
        point,
        value,
      ];

  @override
  bool? get stringify => true;

  factory StatProgressionConfigModel.fromJson(Map<String, dynamic> json) {
    return StatProgressionConfigModel(
      point: json['point'] as int,
      value: json['value'] as int,
    );
  }
}
