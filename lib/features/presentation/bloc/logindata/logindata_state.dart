part of 'logindata_bloc.dart';

abstract class LogindataState extends Equatable {
  const LogindataState();
}

class LogindataInitial extends LogindataState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LogindataState {
  @override
  List<Object> get props => [];
}

class LoggedUserProfileState extends LogindataState {
  final UserProfile user;

  LoggedUserProfileState({@required this.user});

  @override
  List<Object> get props => [user];
}

class LoginLoadedState extends LogindataState {
  final String message;

  LoginLoadedState({@required this.message});
  @override
  List<Object> get props => [message];
}

class LoginErrorState extends LogindataState {
  final String message;

  LoginErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
