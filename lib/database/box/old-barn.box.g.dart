// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old-barn.box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OldBarnAdapter extends TypeAdapter<OldBarn> {
  @override
  final int typeId = 6;

  @override
  OldBarn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OldBarn(
      wood: fields[0] as int,
      ore: fields[1] as int,
      fish: fields[2] as int,
      linen: fields[3] as int,
      itemPart: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OldBarn obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.wood)
      ..writeByte(1)
      ..write(obj.ore)
      ..writeByte(2)
      ..write(obj.fish)
      ..writeByte(3)
      ..write(obj.linen)
      ..writeByte(4)
      ..write(obj.itemPart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OldBarnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
