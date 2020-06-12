part of 'logindata_bloc.dart';

abstract class LogindataEvent extends Equatable {
  const LogindataEvent();
}

class LoginUserEvent extends LogindataEvent {
  final String f_name;
  final String l_name;
  final String p_number;
  final String id;
  final String gender;
  final String dob;

  LoginUserEvent({
    @required this.f_name,
    @required this.l_name,
    @required this.p_number,
    @required this.id,
    @required this.gender,
    @required this.dob,
  });
  @override
  List<Object> get props => [f_name, l_name, p_number, id, gender, dob];
}
