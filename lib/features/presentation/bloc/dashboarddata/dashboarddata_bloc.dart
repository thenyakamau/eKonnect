import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eKonnect/features/domain/usecases/GetUserProfile.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/util/Constants.dart';
import '../../../data/models/InteractionModel.dart';
import '../../../domain/entities/Countries.dart';
import '../../../domain/entities/Interactions.dart';
import '../../../domain/entities/UserProfile.dart';
import '../../../domain/usecases/GetCountryData.dart';
import '../../../domain/usecases/GetDashBoardCache.dart';

part 'dashboarddata_event.dart';
part 'dashboarddata_state.dart';

class DashboarddataBloc extends Bloc<DashboarddataEvent, DashboarddataState> {
  final GetCountryData getCountryData;
  final GetUserProfile userProfile;

  DashboarddataBloc({
    @required this.getCountryData,
    @required this.userProfile,
  });

  @override
  DashboarddataState get initialState => DashboarddataInitial();

  @override
  Stream<DashboarddataState> mapEventToState(
    DashboarddataEvent event,
  ) async* {
    if (event is GetDashBoardData) {
      final user = await userProfile(NoParams());
      // yield dashBoardData.fold((failure) => DashBoardCacheErrorState(),
      //     (cacheItems) {
      //   final user = cacheItems[0];
      //   final world = cacheItems[1];
      //   final kenya = cacheItems[2];
      //   final interactions = cacheItems[3];
      //   print(cacheItems);
      //   return DashboarddataLoadingState(
      //     user: user,
      //     world: world,
      //     kenya: kenya,
      //     interaction: interactions,
      //   );
      // });

      yield* user.fold((failure)async*{ yield DashBoardCacheErrorState();}, (profile) async*{
         final worldEither = await getCountryData(CountryParams(country: "World"));
      yield* worldEither.fold((failure) async* {
        yield DashboarddataErrorState(message: _mapFailureToMessage(failure));
      }, (world) async* {
        final kenyanEither =
            await getCountryData(CountryParams(country: "kenya"));
        yield* kenyanEither.fold((failure) async* {
          yield DashboarddataErrorState(message: _mapFailureToMessage(failure));
        }, (country) async* {
          //yield DashboarddataLoadedState(world: world, kenya: country, userProfile: us, interactions: null)
        });
      });
    
      });

      //yield DashboarddataLoadingState();

     
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
