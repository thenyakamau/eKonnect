import 'package:eKonnect/core/util/CheckAppState.dart';
import 'package:meta/meta.dart';

class CheckLogin {
  final CheckAppState appState;

  CheckLogin({@required this.appState});

  Future<bool> call() {
    return appState.userLoggedIn();
  }
}
