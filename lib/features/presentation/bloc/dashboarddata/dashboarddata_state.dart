part of 'dashboarddata_bloc.dart';

abstract class DashboarddataState extends Equatable {
  const DashboarddataState();
}

class DashboarddataInitial extends DashboarddataState {
  @override
  List<Object> get props => [];
}

class DashboarddataLoadingState extends DashboarddataState {
  @override
  List<Object> get props => [];
}

class DashboarddataLoadedState extends DashboarddataState {
  final Countries world;
  final Countries kenya;
  final UserProfile userProfile;

  DashboarddataLoadedState(
      {@required this.world, @required this.kenya, @required this.userProfile});
  @override
  List<Object> get props => [world, kenya, userProfile];
}

class DashboarddataErrorState extends DashboarddataState {
  final String message;

  DashboarddataErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
