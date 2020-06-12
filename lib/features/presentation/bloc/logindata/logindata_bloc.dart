import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/AuthenticationChecker.dart';
import '../../../domain/usecases/LoginUser.dart';

part 'logindata_event.dart';
part 'logindata_state.dart';

class LogindataBloc extends Bloc<LogindataEvent, LogindataState> {
  final CheckAuthentication checkAuthentication;
  final LoginUser loginUser;

  LogindataBloc({
    @required this.checkAuthentication,
    @required this.loginUser,
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
      });
    }
  }
}
