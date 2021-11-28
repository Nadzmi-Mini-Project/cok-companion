import 'package:cokc/app/home/view/home.view.dart';
import 'package:cokc/common/router/app-router.dart';
import 'package:cokc/database/box/character.box.dart';
import 'package:cokc/database/box/player.box.dart';
import 'package:cokc/database/box/stat.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(PlayerAdapter());
  Hive.registerAdapter(StatAdapter());

  if (!Hive.isBoxOpen(TableCollection.characters)) {
    await Hive.openBox<Character>(TableCollection.characters);
  }
  if (!Hive.isBoxOpen(TableCollection.players)) {
    await Hive.openBox<Player>(TableCollection.players);
  }

  // TODO: find a way to seed initial data using hive
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

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoK Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: const HomeView(),
    );
  }
}
