// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InteractionModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InteractionModelAdapter extends TypeAdapter<InteractionModel> {
  @override
  final typeId = 1;

  @override
  InteractionModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InteractionModel(
      date: fields[0] as String,
      from_contact: fields[1] as String,
      to_contact: fields[2] as String,
      location: fields[3] as String,
      latitude: fields[4] as String,
      longtitude: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InteractionModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.from_contact)
      ..writeByte(2)
      ..write(obj.to_contact)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longtitude);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionModel _$InteractionModelFromJson(Map<String, dynamic> json) {
  return InteractionModel(
    date: json['date'] as String,
    from_contact: json['from_contact'] as String,
    to_contact: json['to_contact'] as String,
    location: json['location'] as String,
    latitude: json['latitude'] as String,
    longtitude: json['longtitude'] as String,
  );
}

Map<String, dynamic> _$InteractionModelToJson(InteractionModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'from_contact': instance.from_contact,
      'to_contact': instance.to_contact,
      'location': instance.location,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
    };
