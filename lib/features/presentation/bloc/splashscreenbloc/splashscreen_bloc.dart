import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/CheckFirstTime.dart';
import '../../../domain/usecases/CheckLogin.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  final CheckFirstTime checkFirstTime;
  final CheckLogin checkLogin;

  SplashscreenBloc({@required this.checkFirstTime, @required this.checkLogin});

  @override
  SplashscreenState get initialState => SplashscreenInitial();

  @override
  Stream<SplashscreenState> mapEventToState(
    SplashscreenEvent event,
  ) async* {
    if (event is CheckFirstTimeEvent) {
      final firstTime = await checkFirstTime();

      if (firstTime) {
        yield FirstTimeState();
      } else {
        final checkIsLoggedIn = await checkLogin();
        if (checkIsLoggedIn) {
          yield SplashHomeState();
        } else {
          yield SplashLoginState();
        }
      }
    } else if (event is ScrollIntroPages) {
      yield SplashTermsPageState();
    }
  }
}
