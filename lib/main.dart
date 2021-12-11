import 'package:cokc/app/home/view/home.view.dart';
import 'package:cokc/common/constant/environment.constant.dart';
import 'package:cokc/common/env/env.dart';
import 'package:cokc/common/router/app-router.dart';
import 'package:cokc/database/main.database.dart';
import 'package:cokc/database/seed/character.seed.dart';
import 'package:cokc/database/seed/resource.seed.dart';
import 'package:cokc/database/seed/stat-config.seed.dart';
import 'package:cokc/database/seed/worker.seed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.init();

  await MainDatabase().init(seederList: [
    CharacterSeed(),
    WorkerSeed(),
    ResourceSeed(),
    StatConfigSeed(),
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
      title: (Env.getEnvironment() == Environment.prod)
          ? 'CoK Companion'
          : '[${Env.getEnvironment()}] CoK Companion',
      theme: ThemeData(
        primarySwatch: (Env.getEnvironment() == Environment.dev)
            ? Colors.blue
            : (Env.getEnvironment() == Environment.uat)
                ? Colors.orange
                : (Env.getEnvironment() == Environment.prod)
                    ? Colors.green
                    : Colors.blue,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: (Env.getEnvironment() != Environment.prod),
      onGenerateRoute: AppRouter.generateRoute,
      home: const HomeView(),
    );
  }
}
