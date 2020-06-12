import 'package:eKonnect/features/domain/entities/UserProfile.dart';
import 'package:meta/meta.dart';

class UserProfileModel extends UserProfile {
  final String f_name;
  final String l_name;
  final String p_number;
  final String id;
  final String gender;
  final String dob;
  final String uuid;
  final String location;

  UserProfileModel({
    @required this.f_name,
    @required this.l_name,
    @required this.p_number,
    @required this.id,
    @required this.gender,
    @required this.dob,
    @required this.uuid,
    @required this.location,
  }) : super(
          f_name: f_name,
          l_name: l_name,
          p_number: p_number,
          id: id,
          gender: gender,
          dob: dob,
          uuid: uuid,
          location: location,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      f_name: json['fname'],
      l_name: json['surname'],
      p_number: json['phone'],
      id: json['national_id'],
      gender: json['gender'],
      dob: json['dob'],
      uuid: json['device_id'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fname'] = this.f_name;
    data['surname'] = this.l_name;
    data['phone'] = this.p_number;
    data['national_id'] = this.id;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['device_id'] = this.uuid;
    data['location'] = this.location;
    return data;
  }
}
