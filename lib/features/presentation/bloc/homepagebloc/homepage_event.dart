part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();
}

class TurnOnBluetoothEvent extends HomepageEvent {
  @override
  List<Object> get props => [];
}
