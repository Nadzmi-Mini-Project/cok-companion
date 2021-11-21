import 'package:cokc/app/character/model/character.model.dart';
import 'package:cokc/app/character/service/character-base.service.dart';

class CharacterMockService extends CharacterBaseService {
  @override
  Future<CharacterModel> getCharacterById(String characterId) {
    return Future.value(const CharacterModel(
      id: '1',
      name: 'Character 1',
      imagePath: '...',
    ));
  }

  @override
  Future<List<CharacterModel>> getCharacterList() {
    return Future.value([
      const CharacterModel(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterModel(
        id: '2',
        name: 'Character 2',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterModel(
        id: '3',
        name: 'Character 3',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterModel(
        id: '4',
        name: 'Character 4',
        imagePath: 'asset/image/character/sample.png',
      ),
    ]);
  }
}
