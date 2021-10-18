import 'package:cokc/app/config/entity/config.entity.dart';
import 'package:cokc/app/config/service/config-mock.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configServiceProvider = Provider((ref) => ConfigMockService());

abstract class ConfigBaseService {
  Future<ConfigEntity> getConfigById(String configId);
  Future<ConfigEntity> getConfigByCode(String configCode);
  Future<List<ConfigEntity>> getConfigList();
}
