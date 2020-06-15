import 'package:meta/meta.dart';

import '../../../core/util/CheckAppState.dart';

class CheckFirstTime {
  final CheckAppState appState;

  CheckFirstTime({@required this.appState});

  Future<bool> call() {
    return appState.checkFirstTimeLogin();
  }
}
