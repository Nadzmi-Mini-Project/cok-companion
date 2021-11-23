import 'package:cokc/app/character/model/character.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'character.box.g.dart';

@HiveType(typeId: 0)
class Character extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imagePath;

  Character({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  static CharacterModel toModel(Character entity) => CharacterModel(
        id: entity.id.toString(),
        name: entity.name,
        imagePath: entity.imagePath,
      );

  static Character fromModel(CharacterModel model) => Character(
        id: model.id,
        name: model.name,
        imagePath: model.imagePath,
      );
}
