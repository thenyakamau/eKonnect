// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InteractionModel.dart';

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
