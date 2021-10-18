import 'package:cokc/app/config/entity/config.entity.dart';
import 'package:cokc/app/config/service/config-base.service.dart';

class ConfigMockService extends ConfigBaseService {
  @override
  Future<ConfigEntity> getConfigById(String configId) {
    return Future.value(const ConfigEntity(
      id: '1',
      code: 'code',
      value: 'value',
    ));
  }

  @override
  Future<ConfigEntity> getConfigByCode(String configCode) {
    return Future.value(const ConfigEntity(
      id: '1',
      code: 'code',
      value: 'value',
    ));
  }

  @override
  Future<List<ConfigEntity>> getConfigList() {
    return Future.value([
      const ConfigEntity(
        id: '1',
        code: 'code',
        value: 'value',
      ),
    ]);
  }
}
