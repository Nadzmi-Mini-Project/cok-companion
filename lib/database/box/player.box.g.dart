// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final int typeId = 1;

  @override
  Player read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Player(
      id: fields[0] as String,
      character: fields[1] as Character,
      playerStatList: (fields[2] as List).cast<Stat>(),
      workerStatList: (fields[3] as List).cast<Stat>(),
      workerList: (fields[4] as List).cast<Worker>(),
      statusImpairmentList: (fields[5] as List).cast<StatusImpairment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.character)
      ..writeByte(2)
      ..write(obj.playerStatList)
      ..writeByte(3)
      ..write(obj.workerStatList)
      ..writeByte(4)
      ..write(obj.workerList)
      ..writeByte(5)
      ..write(obj.statusImpairmentList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
