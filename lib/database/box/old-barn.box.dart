import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:hive_flutter/adapters.dart';

part 'old-barn.box.g.dart';

@HiveType(typeId: 6)
class OldBarn extends HiveObject {
  @HiveField(0)
  int wood;

  @HiveField(1)
  int ore;

  @HiveField(2)
  int fish;

  @HiveField(3)
  int linen;

  @HiveField(4)
  int itemPart;

  OldBarn({
    required this.wood,
    required this.ore,
    required this.fish,
    required this.linen,
    required this.itemPart,
  });

  static OldBarnModel toModel(OldBarn entity) => OldBarnModel(
        wood: entity.wood,
        ore: entity.ore,
        fish: entity.fish,
        linen: entity.linen,
        itemPart: entity.itemPart,
      );

  static OldBarn fromModel(OldBarnModel model) => OldBarn(
        wood: model.wood,
        ore: model.ore,
        fish: model.fish,
        linen: model.linen,
        itemPart: model.itemPart,
      );
}
