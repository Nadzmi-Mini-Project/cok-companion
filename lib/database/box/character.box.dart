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
}
