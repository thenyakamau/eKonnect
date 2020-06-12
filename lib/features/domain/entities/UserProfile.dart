import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserProfile extends Equatable {
  final String f_name;
  final String l_name;
  final String p_number;
  final String id;
  final String gender;
  final String dob;
  final String uuid;
  final String location;

  UserProfile({
    @required this.f_name,
    @required this.l_name,
    @required this.p_number,
    @required this.id,
    @required this.gender,
    @required this.dob,
    @required this.uuid,
    @required this.location,
  }) : super();

  @override
  List<Object> get props {
    return [f_name, l_name, p_number, id, gender, dob, uuid, location];
  }
}
