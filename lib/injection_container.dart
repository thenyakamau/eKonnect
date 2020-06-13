import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:eKonnect/core/util/AuthenticationChecker.dart';
import 'package:eKonnect/features/domain/usecases/GetUuid.dart';
import 'package:eKonnect/features/domain/usecases/LoginUser.dart';
import 'package:eKonnect/features/presentation/bloc/logindata/logindata_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/location/GetUserLocation.dart';
import 'core/network/NetworkInfo.dart';
import 'features/data/datasources/EKonnectLocalDataSource.dart';
import 'features/data/datasources/EKonnectRemoteDataSource.dart';
import 'features/data/datasources/VsoftApiService.dart';
import 'features/data/datasources/VsoftRemoteDataSource.dart';
import 'features/data/repositories/EKonnectRepositoryImpl.dart';
import 'features/domain/repositories/EKonnectRepository.dart';
import 'features/domain/usecases/GetUserCounty.dart';
import 'features/presentation/bloc/dashboarddata/dashboarddata_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initializeLogin();
  _initializeDashBoard();
  _initializeEKonnectRepository();

  //!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => CheckAuthentication());
  sl.registerLazySingleton<UserLocation>(
      () => UserLocationImpl(location: sl()));

  //!External
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Location());
}

void _initializeEKonnectRepository() {
  sl.registerLazySingleton<EKonnectRepository>(
    () => EKonnectRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<EKonnectLocalDataSource>(() {
    return EKonnectLocalDataSourceImpl(
        sharedPreferences: sl(), userLocation: sl());
  });
  sl.registerLazySingleton<EKonnectRemoteDataSource>(
      () => EKonnectRemoteDataSourceImpl());

  sl.registerLazySingleton<VsoftRemoteDataSource>(() {
    return VsoftRemoteDataSourceImpl(vsoftApiService: sl());
  });

  sl.registerLazySingleton(() => VsoftApiService.create());
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
  sl.registerFactory(() => DashboarddataBloc(getUserCounty: sl()));
  sl.registerLazySingleton(() => GetUserCounty(eKonnectRepository: sl()));
}
