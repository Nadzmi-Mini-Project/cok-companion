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
