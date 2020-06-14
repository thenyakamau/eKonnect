import 'dart:convert';

import 'package:eKonnect/features/data/models/CountriesModel.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/location/GetUserLocation.dart';
import '../../../core/util/Constants.dart';
import '../../../core/util/GenerateUuid.dart';
import '../models/UserProfileModel.dart';

abstract class EKonnectLocalDataSource {
  Future<UserProfileModel> getUserData();
  Future<void> cacheUser(UserProfileModel cacheUser);
  Future<String> getUUid();
  Future<String> getUserCounty();
  Future<void> cacheCountries(List<CountriesModel> countriesModel);
  Future<List<CountriesModel>> getCountries();
}

class EKonnectLocalDataSourceImpl implements EKonnectLocalDataSource {
  final SharedPreferences sharedPreferences;
  final UserLocation userLocation;

  EKonnectLocalDataSourceImpl({
    @required this.sharedPreferences,
    @required this.userLocation,
  });

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

  @override
  Future<String> getUUid() {
    String uuid = sharedPreferences.getString(CACHED_UUID);
    if (uuid != null) {
      return Future.value(uuid);
    } else {
      uuid = generateUUId();
      sharedPreferences.setString(CACHED_UUID, uuid);
      return Future.value(uuid);
    }
  }

  @override
  Future<String> getUserCounty() async {
    String userLocationString = sharedPreferences.getString(CACHED_USER_COUNTY);
    if (userLocationString != null) {
      return Future.value(userLocationString);
    } else {
      try {
        userLocationString = await userLocation.getCounty();
        return Future.value(userLocationString);
      } on PermissionDeniedException {
        throw PermissionDeniedException();
      } on PermissionNeveAskedException {
        throw PermissionNeveAskedException();
      }
    }
  }

  @override
  Future<void> cacheCountries(List<CountriesModel> countriesModel) {}

  @override
  Future<List<CountriesModel>> getCountries() {}
}
