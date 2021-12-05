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
          imagePath: 'asset/icon/resource/wood.png',
        ),
        Resource(
          id: '2',
          code: ResourceCode.ore.index,
          name: 'Ore',
          imagePath: 'asset/icon/resource/ore.png',
        ),
        Resource(
          id: '3',
          code: ResourceCode.fish.index,
          name: 'Fish',
          imagePath: 'asset/icon/resource/fish.png',
        ),
        Resource(
          id: '4',
          code: ResourceCode.linen.index,
          name: 'Linen',
          imagePath: 'asset/icon/resource/linen.png',
        ),
        Resource(
          id: '5',
          code: ResourceCode.part.index,
          name: 'Item Part',
          imagePath: 'asset/icon/resource/item-part.png',
        ),
      ]);
    }
  }
}
