import 'package:cokc/app/home/view/home.view.dart';
import 'package:cokc/common/router/app-router.dart';
import 'package:cokc/database/main.database.dart';
import 'package:cokc/database/seed/character.seed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await MainDatabase().init(seederList: [
    CharacterSeed(),
  ]);

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
