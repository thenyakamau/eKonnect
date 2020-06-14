import 'package:eKonnect/features/data/models/UserProfileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

import 'Constants.dart';

class CheckAppState {
  final SharedPreferences sharedPreferences;

  CheckAppState({@required this.sharedPreferences});

  Future<bool> checkFirstTimeLogin() async {
    String firsttime = sharedPreferences.getString(CACHED_FIRST_TIME);
    if (firsttime != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> userLoggedIn() async {
    UserProfileModel userProfileModel = sharedPreferences.get(CACHED_USER);
    if (userProfileModel != null) {
      return true;
    } else {
      return false;
    }
  }
}
