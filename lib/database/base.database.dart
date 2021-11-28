import 'package:cokc/database/seed/base.seed.dart';

abstract class BaseDatabase {
  Future init({List<BaseSeed> seederList = const []});
}
