// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat-progression-config.box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatProgressionConfigAdapter extends TypeAdapter<StatProgressionConfig> {
  @override
  final int typeId = 7;

  @override
  StatProgressionConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatProgressionConfig(
      point: fields[0] as int,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StatProgressionConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.point)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatProgressionConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
