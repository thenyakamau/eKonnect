import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eKonnect/features/domain/usecases/CheckFirstTime.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  final CheckFirstTime checkFirstTime;

  SplashscreenBloc({@required this.checkFirstTime});

  @override
  SplashscreenState get initialState => SplashscreenInitial();

  @override
  Stream<SplashscreenState> mapEventToState(
    SplashscreenEvent event,
  ) async* {
    if(event is CheckFirstTimeEvent) {
      final firstTime = await 
    }
  }
}
