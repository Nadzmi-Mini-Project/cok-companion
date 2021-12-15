import 'package:cokc/app/status-impairment/enum/impairment-code.enum.dart';
import 'package:cokc/database/box/status-impairment.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatusImpairmentSeed extends BaseSeed {
  @override
  Future seed() async {
    if (Hive.box<StatusImpairment>(TableCollection.statusImpairment).length <=
        0) {
      await Hive.box<StatusImpairment>(TableCollection.statusImpairment)
          .addAll([
        StatusImpairment(
          id: '1',
          code: ImpairmentCode.poisonStrong.index,
          name: 'Strong Poison',
          imagePath: 'asset/icon/status-impairment/poison-strong.png',
        ),
        StatusImpairment(
          id: '2',
          code: ImpairmentCode.poisonWeak.index,
          name: 'Weak Poison',
          imagePath: 'asset/icon/status-impairment/poison-weak.png',
        ),
        StatusImpairment(
          id: '3',
          code: ImpairmentCode.curse.index,
          name: 'Curse',
          imagePath: 'asset/icon/status-impairment/curse.png',
        ),
      ]);
    }
  }
}
