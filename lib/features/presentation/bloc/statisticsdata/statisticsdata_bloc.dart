import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'statisticsdata_event.dart';
part 'statisticsdata_state.dart';

class StatisticsdataBloc extends Bloc<StatisticsdataEvent, StatisticsdataState> {
  @override
  StatisticsdataState get initialState => StatisticsdataInitial();

  @override
  Stream<StatisticsdataState> mapEventToState(
    StatisticsdataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
