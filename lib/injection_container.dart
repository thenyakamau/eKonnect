import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bluetooth/BlueTooth.dart';
import 'core/location/GetUserLocation.dart';
import 'core/network/NetworkInfo.dart';
import 'core/util/AuthenticationChecker.dart';
import 'core/util/CheckAppState.dart';
import 'database/EkonnectInteractions.dart';
import 'features/data/datasources/EKonnectApiService.dart';
import 'features/data/datasources/EKonnectLocalDataSource.dart';
import 'features/data/datasources/EKonnectRemoteDataSource.dart';
import 'features/data/datasources/VsoftApiService.dart';
import 'features/data/datasources/VsoftRemoteDataSource.dart';
import 'features/data/repositories/EKonnectRepositoryImpl.dart';
import 'features/domain/repositories/EKonnectRepository.dart';
import 'features/domain/usecases/CheckFirstTime.dart';
import 'features/domain/usecases/CheckLogin.dart';
import 'features/domain/usecases/GetCountries.dart';
import 'features/domain/usecases/GetCountryData.dart';
import 'features/domain/usecases/GetUserCounty.dart';
import 'features/domain/usecases/GetUuid.dart';
import 'features/domain/usecases/LoginUser.dart';
import 'features/domain/usecases/TurnOnBlueTooth.dart';
import 'features/presentation/bloc/dashboarddata/dashboarddata_bloc.dart';
import 'features/presentation/bloc/homepagebloc/homepage_bloc.dart';
import 'features/presentation/bloc/logindata/logindata_bloc.dart';
import 'features/presentation/bloc/splashscreenbloc/splashscreen_bloc.dart';
import 'features/presentation/bloc/statisticsdata/statisticsdata_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initializeLogin();
  _initializeDashBoard();
  _initializeEKonnectRepository();
  _initializeStatistics();
  _initializeSplashScreen();
  _initializeHome();

  //!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => CheckAuthentication());
  sl.registerLazySingleton<UserLocation>(
      () => UserLocationImpl(location: sl()));
  sl.registerLazySingleton(() => CheckAppState(sharedPreferences: sl()));
  sl.registerLazySingleton(() => BlueToothProvider(
        bluetoothSerial: sl(),
      ));

  //!External
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Location());
  sl.registerLazySingleton<EKonnectInteractions>(
      () => EKonnectInteractionsImpl());
  sl.registerLazySingleton(() => FlutterBluetoothSerial.instance);
}

void _initializeEKonnectRepository() {
  sl.registerLazySingleton<EKonnectRepository>(
    () => EKonnectRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      eKonnectRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<EKonnectLocalDataSource>(() {
    return EKonnectLocalDataSourceImpl(
        sharedPreferences: sl(), userLocation: sl(), interactions: sl());
  });
  sl.registerLazySingleton<EKonnectRemoteDataSource>(
      () => EKonnectRemoteDataSourceImpl(eKonnectApiService: sl()));

  sl.registerLazySingleton<VsoftRemoteDataSource>(() {
    return VsoftRemoteDataSourceImpl(vsoftApiService: sl());
  });

  sl.registerLazySingleton(() => VsoftApiService.create());
  sl.registerLazySingleton(() => EKonnectApiService.create());
}

void _initializeLogin() {
  sl.registerFactory(
    () => LogindataBloc(
      checkAuthentication: sl(),
      loginUser: sl(),
      getUUid: sl(),
      getUserCounty: sl(),
    ),
  );

  sl.registerLazySingleton(() => LoginUser(repository: sl()));
  sl.registerLazySingleton(() => GetUUid(localDataSource: sl()));
}

void _initializeDashBoard() {
  sl.registerFactory(() => DashboarddataBloc(getCountryData: sl()));
  sl.registerLazySingleton(() => GetCountryData(repository: sl()));
  sl.registerLazySingleton(() => GetUserCounty(eKonnectRepository: sl()));
}

void _initializeStatistics() {
  sl.registerFactory(() => StatisticsdataBloc(getCountries: sl()));
  sl.registerLazySingleton(() => GetCountries(eKonnectRepository: sl()));
}

void _initializeSplashScreen() {
  sl.registerFactory(
      () => SplashscreenBloc(checkFirstTime: sl(), checkLogin: sl()));
  sl.registerLazySingleton(() => CheckFirstTime(appState: sl()));
  sl.registerLazySingleton(() => CheckLogin(appState: sl()));
}

void _initializeHome() {
  sl.registerFactory(() => HomepageBloc(turnOnBlueTooth: sl()));
  sl.registerLazySingleton(() => TurnOnBlueTooth(blueToothProvider: sl()));
}
