// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_opened_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOpenedStatusAdapter extends TypeAdapter<HiveOpenedStatus> {
  @override
  final int typeId = 7;

  @override
  HiveOpenedStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOpenedStatus(
      date: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveOpenedStatus obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOpenedStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
