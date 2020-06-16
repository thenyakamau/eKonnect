import 'package:eKonnect/core/bluetooth/BlueTooth.dart';
import 'package:meta/meta.dart';

class TurnOnBlueTooth {
  final BlueToothProvider blueToothProvider;

  TurnOnBlueTooth({@required this.blueToothProvider});

  Future<bool> call() {
    return blueToothProvider.searchForDevices();
  }
}
