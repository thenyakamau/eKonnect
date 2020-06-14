import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/UserProfile.dart';

part 'UserProfileModel.g.dart';

@JsonSerializable()
class UserProfileModel extends UserProfile {
  final String fname;
  final String surname;
  final String phone;
  final String national_id;
  final String gender;
  final String dob;
  final String device_id;
  final String location;

  UserProfileModel({
    @required this.fname,
    @required this.surname,
    @required this.phone,
    @required this.national_id,
    @required this.gender,
    @required this.dob,
    @required this.device_id,
    @required this.location,
  }) : super(
          fname: fname,
          surname: surname,
          phone: phone,
          national_id: national_id,
          gender: gender,
          dob: dob,
          device_id: device_id,
          location: location,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
