part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomepageInitial extends HomepageState {
  @override
  List<Object> get props => [];
}

class BlueToothOnErrorState extends HomepageState {
  final String message;

  BlueToothOnErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
