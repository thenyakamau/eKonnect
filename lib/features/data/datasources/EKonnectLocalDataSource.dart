import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/location/GetUserLocation.dart';
import '../../../core/util/Constants.dart';
import '../../../core/util/GenerateUuid.dart';
import '../../../database/EKonnectDAO.dart';
import '../../../database/EKonnectDatabase.dart';
import '../../../database/EkonnectInteractions.dart';
import '../models/CountriesModel.dart';
import '../models/InteractionModel.dart';
import '../models/UserProfileModel.dart';

abstract class EKonnectLocalDataSource {
  Future<UserProfileModel> getUserData();
  Future<void> cacheUser(UserProfileModel cacheUser);
  Future<String> getUUid();
  Future<String> getUserCounty();
  Future<void> cacheCountries(List<CountriesModel> countriesModel);
  Future<List<CountriesModel>> getCountries();
  Future<List<InteractionModel>> getInteractions();
  Future<void> cacheInteractions(InteractionModel interactionModel);
  Future<CountriesModel> getCountry(String country);
}

class EKonnectLocalDataSourceImpl implements EKonnectLocalDataSource {
  final SharedPreferences sharedPreferences;
  final UserLocation userLocation;
  final EKonnectInteractions interactions;
  final EKonnectDao eKonnectDao;

  EKonnectLocalDataSourceImpl({
    @required this.sharedPreferences,
    @required this.userLocation,
    @required this.interactions,
    @required this.eKonnectDao,
  });

  @override
  Future<void> cacheUser(UserProfileModel cacheUser) {
    String useradded = "added_user";
    sharedPreferences.setString(CACHED_FIRST_TIME, useradded);
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
        await sharedPreferences.setString(
            CACHED_USER_COUNTY, userLocationString);
        return Future.value(userLocationString);
      } on PermissionDeniedException {
        throw PermissionDeniedException();
      } on PermissionNeveAskedException {
        throw PermissionNeveAskedException();
      }
    }
  }

  @override
  Future<void> cacheCountries(List<CountriesModel> countriesModel) async {
    await eKonnectDao.deleteAll();
    for (var i = 0; i < countriesModel.length; i++) {
      try {
        CountriesModel e = countriesModel[i];
        CountriesTable countriesTable = CountriesTable(
          country: e.country,
          cases: e.cases,
          todayCases: e.todayCases,
          deaths: e.deaths,
          todayDeaths: e.todayDeaths,
          recovered: e.recovered,
          active: e.active,
          critical: e.critical,
          casesPerOneMillion: e.casesPerOneMillion,
          deathsPerOneMillion: e.deathsPerOneMillion,
          totalTests: e.totalTests,
          testsPerOneMillion: e.testsPerOneMillion,
        );

        await eKonnectDao.insertCountry(countriesTable);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<CountriesModel>> getCountries() async {
    List<CountriesTable> countriesObject = await eKonnectDao.getCountries();
    List<CountriesModel> countries = [];

    for (var i = 0; i < countriesObject.length; i++) {
      CountriesTable e = countriesObject[i];
      CountriesModel countriesModel = new CountriesModel(
        country: e.country,
        cases: e.cases,
        todayCases: e.todayCases,
        deaths: e.deaths,
        todayDeaths: e.todayDeaths,
        recovered: e.recovered,
        active: e.active,
        critical: e.critical,
        casesPerOneMillion: e.casesPerOneMillion,
        deathsPerOneMillion: e.deathsPerOneMillion,
        totalTests: e.totalTests,
        testsPerOneMillion: e.testsPerOneMillion,
      );

      countries.add(countriesModel);
    }
    return countries;
  }

  @override
  Future<void> cacheInteractions(InteractionModel interactionModel) async {
    return await interactions.saveInteraction(interactionModel);
  }

  @override
  Future<List<InteractionModel>> getInteractions() async {
    print(await interactions.getInteractions());
    return await interactions.getInteractions();
  }

  @override
  Future<CountriesModel> getCountry(String country) async {
    return await interactions.getCountry(country);
  }
}
