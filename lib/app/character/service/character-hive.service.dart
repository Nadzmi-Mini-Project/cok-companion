import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/character/service/character-base.service.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:hive/hive.dart';

class CharacterHiveService extends CharacterBaseService {
  @override
  Future<CharacterModel> getCharacterById(String characterId) async {
    final character = Hive.box<Character>(TableCollection.characters)
        .values
        .firstWhere((element) => element.id == characterId);

    return Future.value(CharacterModel(
      id: character.id,
      name: character.name,
      imagePath: character.imagePath,
    ));
  }

  @override
  Future<List<CharacterModel>> getCharacterList() {
    final characterList =
        Hive.box<Character>(TableCollection.characters).values;

    return Future.value(characterList
        .map(
          (e) => CharacterModel(id: e.id, name: e.name, imagePath: e.imagePath),
        )
        .toList());
  }
}
