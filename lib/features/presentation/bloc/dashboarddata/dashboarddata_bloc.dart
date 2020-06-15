import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/util/Constants.dart';
import '../../../data/models/InteractionModel.dart';
import '../../../domain/entities/Countries.dart';
import '../../../domain/entities/UserProfile.dart';
import '../../../domain/usecases/GetCountryData.dart';

part 'dashboarddata_event.dart';
part 'dashboarddata_state.dart';

class DashboarddataBloc extends Bloc<DashboarddataEvent, DashboarddataState> {
  final GetCountryData getCountryData;

  DashboarddataBloc({@required this.getCountryData});

  @override
  DashboarddataState get initialState => DashboarddataInitial();

  @override
  Stream<DashboarddataState> mapEventToState(
    DashboarddataEvent event,
  ) async* {
    if (event is GetDashBoardData) {
      yield DashboarddataLoadingState();

      final worldEither = await getCountryData(CountryParams(country: "World"));
      yield* worldEither.fold((failure) async* {
        yield DashboarddataErrorState(message: _mapFailureToMessage(failure));
      }, (coutry) async* {
        final kenyanEither =
            await getCountryData(CountryParams(country: "kenya"));
        yield* kenyanEither.fold((failure) async* {
          yield DashboarddataErrorState(message: _mapFailureToMessage(failure));
        }, (country) async* {});
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
