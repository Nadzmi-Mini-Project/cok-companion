// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat-config.box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatConfigAdapter extends TypeAdapter<StatConfig> {
  @override
  final int typeId = 8;

  @override
  StatConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatConfig(
      code: fields[0] as int,
      minimumPoint: fields[1] as int,
      maximumPoint: fields[2] as int,
      progressionConfigList: (fields[3] as List).cast<StatProgressionConfig>(),
    );
  }

  @override
  void write(BinaryWriter writer, StatConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.minimumPoint)
      ..writeByte(2)
      ..write(obj.maximumPoint)
      ..writeByte(3)
      ..write(obj.progressionConfigList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
