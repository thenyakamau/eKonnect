import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eKonnect/core/errors/Failures.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/UseCases.dart';
import '../../../domain/usecases/GetUserCounty.dart';

part 'dashboarddata_event.dart';
part 'dashboarddata_state.dart';

class DashboarddataBloc extends Bloc<DashboarddataEvent, DashboarddataState> {
  final GetUserCounty getUserCounty;

  DashboarddataBloc({@required this.getUserCounty});

  @override
  DashboarddataState get initialState => DashboarddataInitial();

  @override
  Stream<DashboarddataState> mapEventToState(
    DashboarddataEvent event,
  ) async* {
    if (event is GetLocationEvent) {
      final userCountyEither = await getUserCounty(NoParams());
      userCountyEither.fold((failure) => null, (county) => print(county));
    }
  }
}
