import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final String id;
  final String name;
  final String imagePath;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
      ];

  @override
  bool? get stringify => true;
}
