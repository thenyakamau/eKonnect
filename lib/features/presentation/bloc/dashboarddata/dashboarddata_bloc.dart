import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboarddata_event.dart';
part 'dashboarddata_state.dart';

class DashboarddataBloc extends Bloc<DashboarddataEvent, DashboarddataState> {
  @override
  DashboarddataState get initialState => DashboarddataInitial();

  @override
  Stream<DashboarddataState> mapEventToState(
    DashboarddataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
