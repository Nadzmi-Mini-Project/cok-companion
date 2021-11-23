import 'package:equatable/equatable.dart';

class CreatePlayerModel extends Equatable {
  final String characterId;

  const CreatePlayerModel({
    required this.characterId,
  });

  @override
  List<Object?> get props => [
        characterId,
      ];

  @override
  bool? get stringify => true;
}
