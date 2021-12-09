import 'package:cokc/app/config/model/config.model.dart';
import 'package:cokc/app/config/model/stat-config.model.dart';
import 'package:cokc/app/config/service/config-hive.service.dart';
import 'package:cokc/app/stat/enum/stat-code.enum.dart';
import 'package:cokc/database/provider/stat-config-box.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configServiceProvider = Provider((ref) => ConfigHiveService(
      statConfigBox: ref.read(statConfigBoxProvider),
    ));

abstract class ConfigBaseService {
  Future<ConfigModel> getConfigById(String configId);
  Future<ConfigModel> getConfigByCode(String configCode);
  Future<List<ConfigModel>> getConfigList();
  Future<List<StatConfigModel>> getStatConfigList();
  Future<StatConfigModel> getStatConfigByCode(StatCode code);
}
