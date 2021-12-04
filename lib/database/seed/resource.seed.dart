import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/database/box/resource.box.dart';
import 'package:cokc/database/constant/table-collection.constant.dart';
import 'package:cokc/database/seed/base.seed.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResourceSeed extends BaseSeed {
  @override
  Future seed() async {
    if (Hive.box<Resource>(TableCollection.resources).length <= 0) {
      await Hive.box<Resource>(TableCollection.resources).addAll([
        Resource(
          id: '1',
          code: ResourceCode.wood.index,
          name: 'Wood',
          imagePath: 'asset/icon/stat/max-hp.png', // TODO: use correct image
        ),
        Resource(
          id: '2',
          code: ResourceCode.ore.index,
          name: 'Ore',
          imagePath: 'asset/icon/stat/cur-hp.png', // TODO: use correct image
        ),
        Resource(
          id: '3',
          code: ResourceCode.fish.index,
          name: 'Fish',
          imagePath: 'asset/icon/stat/attack.png', // TODO: use correct image
        ),
        Resource(
          id: '4',
          code: ResourceCode.linen.index,
          name: 'Linen',
          imagePath: 'asset/icon/stat/gather.png', // TODO: use correct image
        ),
        Resource(
          id: '5',
          code: ResourceCode.part.index,
          name: 'Item Part',
          imagePath: 'asset/icon/stat/heal.png', // TODO: use correct image
        ),
      ]);
    }
  }
}
