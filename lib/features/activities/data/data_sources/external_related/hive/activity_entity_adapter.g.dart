// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entity_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityEntityHiveAdapter extends TypeAdapter<ActivityEntityHive> {
  @override
  final int typeId = 1;

  @override
  ActivityEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityEntityHive(
      activity: fields[0] as String,
      type: fields[1] as String,
      accessibility: fields[2] as num,
      key: fields[3] as String,
      price: fields[4] as String,
      participants: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityEntityHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.activity)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.accessibility)
      ..writeByte(3)
      ..write(obj.key)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.participants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
