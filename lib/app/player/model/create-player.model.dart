import 'package:equatable/equatable.dart';

class CreatePlayerModel extends Equatable {
  final String id;
  final String characterId;

  const CreatePlayerModel({
    required this.id,
    required this.characterId,
  });

  @override
  List<Object?> get props => [
        id,
        characterId,
      ];

  @override
  bool? get stringify => true;
}
