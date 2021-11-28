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
        name: 'Brutius The broken',
        imagePath: 'asset/image/character/brutius-the-broken.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '2',
        name: 'Calamis Earthshaker',
        imagePath: 'asset/image/character/calamis-earthshaker.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '3',
        name: 'Sesharra',
        imagePath: 'asset/image/character/sesharra.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '4',
        name: 'Thralir Hillfeet',
        imagePath: 'asset/image/character/thralir-hillfeet.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '5',
        name: 'T\'lorra The Blessed',
        imagePath: 'asset/image/character/tlorra-the-blessed.png',
      ));
      await Hive.box<Character>(TableCollection.characters).add(Character(
        id: '6',
        name: 'Viliria Ellion',
        imagePath: 'asset/image/character/vyliria-ellion.png',
      ));
    }
  }
}
