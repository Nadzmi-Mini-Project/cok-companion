import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/config/model/config.model.dart';
import 'package:cokc/app/config/service/config-base.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/database/box/stat-config.box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfigHiveService extends ConfigBaseService {
  final Box<StatConfig> statConfigBox;

  ConfigHiveService({required this.statConfigBox});

  @override
  Future<ConfigModel> getConfigByCode(String configCode) {
    throw UnimplementedError();
  }

  @override
  Future<ConfigModel> getConfigById(String configId) {
    throw UnimplementedError();
  }

  @override
  Future<List<ConfigModel>> getConfigList() {
    throw UnimplementedError();
  }

  @override
  Future<StatConfigModel> getStatConfigByCode(StatCode code) async {
    final config = statConfigBox.values
        .firstWhere((element) => element.code == code.index);

    return Future.value(StatConfig.toModel(config));
  }

  @override
  Future<List<StatConfigModel>> getStatConfigList() async {
    return Future.value(
        statConfigBox.values.map((e) => StatConfig.toModel(e)).toList());
  }
}
