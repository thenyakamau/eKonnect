import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/bluetooth/BlueTooth.dart';
import '../../../core/errors/Exceptions.dart';
import '../../../core/location/GetUserLocation.dart';
import '../../../core/util/Constants.dart';
import '../../../database/EKonnectDAO.dart';
import '../../../database/EKonnectDatabase.dart';
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
  final EKonnectDao eKonnectDao;
  final BlueToothProvider blueToothProvider;

  EKonnectLocalDataSourceImpl(
      {@required this.sharedPreferences,
      @required this.userLocation,
      @required this.eKonnectDao,
      @required this.blueToothProvider});

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
  Future<String> getUUid() async {
    String uuid = sharedPreferences.getString(CACHED_UUID);
    if (uuid != null) {
      return Future.value(uuid);
    } else {
      uuid = await blueToothProvider.generateBluetoothAddress();
      print(uuid);
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
  Future<CountriesModel> getCountry(String country) async {
    List<CountriesTable> countriesObject =
        await eKonnectDao.getCountry(country);
    CountriesTable e = countriesObject.first;

    return CountriesModel(
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
  }

  @override
  Future<void> cacheInteractions(InteractionModel interactionModel) async {
    InteractionsTable interactions = InteractionsTable(
      date: interactionModel.date,
      from_contact: interactionModel.from_contact,
      to_contact: interactionModel.to_contact,
      location: interactionModel.location,
      latitude: interactionModel.latitude,
      longtitude: interactionModel.longtitude,
    );
    return await eKonnectDao.insertInteraction(interactions);
  }

  @override
  Future<List<InteractionModel>> getInteractions() async {
    List<InteractionsTable> interactionsObject =
        await eKonnectDao.getInteractions();

    List<InteractionModel> interactions = [];
    for (var i = 0; i < interactionsObject.length; i++) {
      InteractionsTable interactionsTable = interactionsObject[i];
      InteractionModel interactionModel = InteractionModel(
        date: interactionsTable.date,
        from_contact: interactionsTable.from_contact,
        to_contact: interactionsTable.to_contact,
        location: interactionsTable.location,
        latitude: interactionsTable.latitude,
        longtitude: interactionsTable.longtitude,
      );
      interactions.add(interactionModel);
    }

    return interactions;
  }
}
