import 'package:equatable/equatable.dart';

class ApiResponseModel<T> extends Equatable {
  final bool success;
  final T? data;
  final Object? error;

  const ApiResponseModel({
    required this.success,
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [
        success,
        data,
        error,
      ];

  @override
  bool? get stringify => true;
}
