import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final String imagePath;

  const CharacterEntity({
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
