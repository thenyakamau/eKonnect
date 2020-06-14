import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/UseCases.dart';
import '../../../domain/usecases/GetCountries.dart';

part 'statisticsdata_event.dart';
part 'statisticsdata_state.dart';

class StatisticsdataBloc
    extends Bloc<StatisticsdataEvent, StatisticsdataState> {
  final GetCountries getCountries;

  StatisticsdataBloc({@required this.getCountries});
  @override
  StatisticsdataState get initialState => StatisticsdataInitial();

  @override
  Stream<StatisticsdataState> mapEventToState(
    StatisticsdataEvent event,
  ) async* {
    if (event is GetCountriesEvent) {
      yield StatisticsdataLoadingState();
      final countriesEither = await getCountries(NoParams());
      yield* countriesEither.fold((failure) async* {
        print(failure);
        yield StatisticsdataErrorState(message: "Error");
      }, (countries) async* {
        print(countries);
        yield StatisticsdataLoadedState(response: countries);
      });
    }
  }
}
