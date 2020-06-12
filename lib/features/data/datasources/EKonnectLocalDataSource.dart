import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/util/Constants.dart';
import '../models/UserProfileModel.dart';

abstract class EKonnectLocalDataSource {
  Future<UserProfileModel> getUserData();
  Future<void> cacheUser(UserProfileModel cacheUser);
}

class EKonnectLocalDataSourceImpl implements EKonnectLocalDataSource {
  final SharedPreferences sharedPreferences;

  EKonnectLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserProfileModel cacheUser) {
    return sharedPreferences.setString(
        CACHED_USER, json.encode(cacheUser.toJson()));
  }

  @override
  Future<UserProfileModel> getUserData() {
    final jsonString = sharedPreferences.getString(CACHED_USER);

    if (jsonString != null) {
      return Future.value(UserProfileModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
