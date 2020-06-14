part of 'dashboarddata_bloc.dart';

abstract class DashboarddataEvent extends Equatable {
  const DashboarddataEvent();
}

class GetLocationEvent extends DashboarddataEvent {
  @override
  List<Object> get props => [];
}

class GetDashBoardData extends DashboarddataEvent {
  GetDashBoardData();
  @override
  List<Object> get props => [];
}
