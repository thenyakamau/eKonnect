import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eKonnect/features/domain/entities/Interactions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/util/Constants.dart';
import '../../../data/models/InteractionModel.dart';
import '../../../domain/entities/Countries.dart';
import '../../../domain/entities/UserProfile.dart';
import '../../../domain/usecases/GetCountryData.dart';
import '../../../domain/usecases/GetInteractionsCache.dart';
import '../../../domain/usecases/GetUserProfile.dart';

part 'dashboarddata_event.dart';
part 'dashboarddata_state.dart';

class DashboarddataBloc extends Bloc<DashboarddataEvent, DashboarddataState> {
  final GetCountryData getCountryData;
  final GetUserProfile userProfile;
  final GetInteractionsCache interactionsCache;

  DashboarddataBloc({
    @required this.getCountryData,
    @required this.userProfile,
    @required this.interactionsCache,
  });

  @override
  DashboarddataState get initialState => DashboarddataInitial();

  @override
  Stream<DashboarddataState> mapEventToState(
    DashboarddataEvent event,
  ) async* {
    if (event is GetDashBoardData) {
      final user = await userProfile(NoParams());

      yield* user.fold((failure) async* {
        yield DashboarddataLoadingState();
      }, (profile) async* {
        final interactionCacheEither = await interactionsCache(NoParams());

        // yield* interactionCacheEither.fold((failure) async* {
        //   print("error");
        //   yield DashboarddataLoadingState();
        // }, (interactions) async* {

        // });
        yield DashboarddataLoadingState();
        List<Interaction> interactions;

        final worldEither =
            await getCountryData(CountryParams(country: "World"));
        yield* worldEither.fold((failure) async* {
          yield DashboarddataErrorState(message: _mapFailureToMessage(failure));
        }, (world) async* {
          final kenyanEither =
              await getCountryData(CountryParams(country: "kenya"));
          yield* kenyanEither.fold((failure) async* {
            yield DashboarddataErrorState(
                message: _mapFailureToMessage(failure));
          }, (country) async* {
            yield DashboarddataLoadedState(
              world: world,
              kenya: country,
              userProfile: profile,
              interactions: interactions,
            );
          });
        });
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
