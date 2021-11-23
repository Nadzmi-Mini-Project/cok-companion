import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/character/service/character-hive.service.dart';
import 'package:cokc/database/provider/character-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterServiceProvider =
    Provider<CharacterHiveService>((ref) => CharacterHiveService(
          characterBox: ref.read(characterBoxProvider),
        ));

abstract class CharacterBaseService {
  Future<CharacterModel> getCharacterById(String characterId);
  Future<List<CharacterModel>> getCharacterList();
}
