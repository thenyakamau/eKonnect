import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eKonnect/core/errors/Failures.dart';
import 'package:eKonnect/core/util/Constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/UseCases.dart';
import '../../../domain/entities/Countries.dart';
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
        yield StatisticsdataErrorState(message: _mapFailureToMessage(failure));
      }, (countries) async* {
        yield StatisticsdataLoadedState(countries: countries);
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case PermissionDeniedFailure:
        return PERMISION_DENIED;
      case PermissionNeveAskedFailure:
        return PERMISION_NEVER_ASKED;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
