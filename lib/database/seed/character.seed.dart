import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CharacterSeed extends BaseSeed {
  @override
  Future seed() async {
    if (Hive.box<Character>(TableCollection.characters).length <= 0) {
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '1',
        name: 'Character 1',
        imagePath: 'asset/image/character/sample.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '2',
        name: 'Character 2',
        imagePath: 'asset/image/character/sample.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '3',
        name: 'Character 3',
        imagePath: 'asset/image/character/sample.png',
      ));
    }
  }
}
