import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:cokc/app/character/service/character-base.service.dart';

class CharacterMockService extends CharacterBaseService {
  @override
  Future<CharacterEntity> getCharacterById(String characterId) {
    return Future.value(const CharacterEntity(
      id: '1',
      name: 'Character 1',
      imagePath: '...',
    ));
  }

  @override
  Future<List<CharacterEntity>> getCharacterList() {
    return Future.value([
      const CharacterEntity(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterEntity(
        id: '2',
        name: 'Character 2',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterEntity(
        id: '3',
        name: 'Character 3',
        imagePath: 'asset/image/character/sample.png',
      ),
      const CharacterEntity(
        id: '4',
        name: 'Character 4',
        imagePath: 'asset/image/character/sample.png',
      ),
    ]);
  }
}
