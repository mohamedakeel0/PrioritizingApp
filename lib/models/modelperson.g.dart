// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelperson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelPersonAdapter extends TypeAdapter<ModelPerson> {
  @override
  final int typeId = 0;

  @override
  ModelPerson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelPerson(
      text: fields[0] as String?,
      time: fields[1] as String?,
      valuelow: fields[2] as bool?,
      priority: fields[3] as int?,
      textfuture: (fields[4] as String?),
      valuemeduim: (fields[5] as bool?),
      valueHigh: (fields[6] as bool?),
      id: (fields[7] as int?),
    );
  }

  @override
  void write(BinaryWriter writer, ModelPerson obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.valuelow)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.textfuture)
      ..writeByte(5)
      ..write(obj.valuemeduim)
      ..writeByte(6)
      ..write(obj.valueHigh)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelPersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
