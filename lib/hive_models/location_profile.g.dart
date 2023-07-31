// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationProfileAdapter extends TypeAdapter<LocationProfile> {
  @override
  final int typeId = 1;

  @override
  LocationProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationProfile(
      id: fields[0] as String,
      color: fields[8] as String,
      lat: fields[1] as String,
      lng: fields[3] as String,
      latSign: fields[2] as String,
      lngSign: fields[4] as String,
      bodyFontSize: fields[7] as double,
      headlineFontSize: fields[5] as double,
      labelFontSize: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LocationProfile obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.latSign)
      ..writeByte(3)
      ..write(obj.lng)
      ..writeByte(4)
      ..write(obj.lngSign)
      ..writeByte(5)
      ..write(obj.headlineFontSize)
      ..writeByte(6)
      ..write(obj.labelFontSize)
      ..writeByte(7)
      ..write(obj.bodyFontSize)
      ..writeByte(8)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
