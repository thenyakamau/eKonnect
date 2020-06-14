import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserProfile extends Equatable {
  final String fname;
  final String surname;
  final String phone;
  final String national_id;
  final String gender;
  final String dob;
  final String device_id;
  final String location;

  UserProfile({
    @required this.fname,
    @required this.surname,
    @required this.phone,
    @required this.national_id,
    @required this.gender,
    @required this.dob,
    @required this.device_id,
    @required this.location,
  }) : super();

  @override
  List<Object> get props {
    return [
      fname,
      surname,
      phone,
      national_id,
      gender,
      dob,
      device_id,
      location
    ];
  }
}
