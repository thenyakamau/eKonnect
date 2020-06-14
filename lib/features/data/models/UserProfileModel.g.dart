// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return UserProfileModel(
    fname: json['fname'] as String,
    surname: json['surname'] as String,
    phone: json['phone'] as String,
    national_id: json['national_id'] as String,
    gender: json['gender'] as String,
    dob: json['dob'] as String,
    device_id: json['device_id'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'surname': instance.surname,
      'phone': instance.phone,
      'national_id': instance.national_id,
      'gender': instance.gender,
      'dob': instance.dob,
      'device_id': instance.device_id,
      'location': instance.location,
    };
