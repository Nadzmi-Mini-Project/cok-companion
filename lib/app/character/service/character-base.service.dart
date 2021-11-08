import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/character/service/character-mock.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterServiceProvider = Provider((ref) => CharacterMockService());

abstract class CharacterBaseService {
  Future<CharacterEntity> getCharacterById(String characterId);
  Future<List<CharacterEntity>> getCharacterList();
}
