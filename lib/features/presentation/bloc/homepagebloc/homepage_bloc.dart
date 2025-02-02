import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/TurnOnBlueTooth.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final TurnOnBlueTooth turnOnBlueTooth;

  HomepageBloc({@required this.turnOnBlueTooth});

  @override
  HomepageState get initialState => HomepageInitial();

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if (event is TurnOnBluetoothEvent) {
      final turnBluetooth = await turnOnBlueTooth();
      if (turnBluetooth) {
        yield HomepageInitial();
      } else {
        yield BlueToothOnErrorState(message: "Please turn on bluetooth");
      }
    }
  }
}
