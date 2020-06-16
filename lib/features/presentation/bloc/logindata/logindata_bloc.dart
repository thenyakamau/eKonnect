import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/usecases/UseCases.dart';
import '../../../../core/util/AuthenticationChecker.dart';
import '../../../../core/util/Constants.dart';
import '../../../data/models/UserProfileModel.dart';
import '../../../domain/entities/ApiSuccess.dart';
import '../../../domain/entities/UserProfile.dart';
import '../../../domain/usecases/GetUserCounty.dart';
import '../../../domain/usecases/GetUserProfile.dart';
import '../../../domain/usecases/GetUuid.dart';
import '../../../domain/usecases/LoginUser.dart';

part 'logindata_event.dart';
part 'logindata_state.dart';

class LogindataBloc extends Bloc<LogindataEvent, LogindataState> {
  final CheckAuthentication checkAuthentication;
  final LoginUser loginUser;
  final GetUUid getUUid;
  final GetUserCounty getUserCounty;
  final GetUserProfile userProfile;

  LogindataBloc({
    @required this.checkAuthentication,
    @required this.loginUser,
    @required this.getUUid,
    @required this.getUserCounty,
    @required this.userProfile,
  })  : assert(checkAuthentication != null),
        assert(loginUser != null);
  @override
  LogindataState get initialState => LogindataInitial();

  @override
  Stream<LogindataState> mapEventToState(
    LogindataEvent event,
  ) async* {
    if (event is LoginUserEvent) {
      final checkEither = checkAuthentication.checkLoginAuthentication(
        event.f_name,
        event.l_name,
        event.p_number,
        event.id,
        event.gender,
        event.dob,
      );
      yield* checkEither.fold((failure) async* {
        yield LoginErrorState(message: failure);
      }, (right) async* {
        yield LoginLoadingState();
        String uuid = await getUUid(NoParams());
        final userCountyEither = await getUserCounty(NoParams());
        yield* userCountyEither.fold((failure) async* {
          yield LoginErrorState(message: _mapFailureToMessage(failure));
        }, (county) async* {
          UserProfileModel userProfileModel = UserProfileModel(
            fname: event.f_name,
            surname: event.l_name,
            phone: event.p_number,
            national_id: event.id,
            gender: event.gender,
            dob: event.dob,
            device_id: uuid,
            location: county,
          );
          final loginEither =
              await loginUser(LoginParams(userProfileModel: userProfileModel));
          yield* _getLoginOrFailure(loginEither);
        });
      });
    } else if (event is LoginResetEvent) {
      yield LogindataInitial();
    } else if (event is CheckUserProfileEvent) {
      final user = await userProfile(NoParams());
      yield* user.fold((failure) async* {
        yield LogindataInitial();
      }, (user) async* {
        yield LoggedUserProfileState(user: user);
      });
    }
  }

  Stream<LogindataState> _getLoginOrFailure(
      Either<Failure, ApiSuccess> loginEither) async* {
    yield loginEither.fold(
      (failure) => LoginErrorState(message: _mapFailureToMessage(failure)),
      (success) {
        if (success.success == true) {
          return LoginLoadedState(message: success.message);
        } else {
          return LoginErrorState(message: success.message);
        }
      },
    );
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
