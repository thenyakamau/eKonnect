import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/ApiSuccess.dart';
import '../../domain/entities/Countries.dart';
import '../../domain/entities/UserProfile.dart';
import '../../domain/repositories/EKonnectRepository.dart';
import '../datasources/EKonnectLocalDataSource.dart';
import '../datasources/EKonnectRemoteDataSource.dart';
import '../datasources/VsoftRemoteDataSource.dart';
import '../models/CountriesModel.dart';
import '../models/InteractionModel.dart';
import '../models/UserProfileModel.dart';

class EKonnectRepositoryImpl implements EKonnectRepository {
  final EKonnectLocalDataSource localDataSource;
  final VsoftRemoteDataSource remoteDataSource;
  final EKonnectRemoteDataSource eKonnectRemoteDataSource;
  final NetworkInfo networkInfo;

  EKonnectRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo,
    @required this.eKonnectRemoteDataSource,
  });

  @override
  Future<Either<Failure, String>> getUserCounty() async {
    String userLocation;
    try {
      userLocation = await localDataSource.getUserCounty();
      return Right(userLocation);
    } on PermissionDeniedException {
      return Left(PermissionDeniedFailure());
    } on PermissionNeveAskedException {
      return Left(PermissionNeveAskedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> loginUser(
      UserProfileModel userProfileModel) async {
    if (await networkInfo.isConnected) {
      try {
        print(userProfileModel.toJson());
        final response = await remoteDataSource.loginUser(userProfileModel);
        localDataSource.cacheUser(userProfileModel);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CountriesModel>>> getCountries() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await eKonnectRemoteDataSource.getCountriesData();
        localDataSource.cacheCountries(response);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> saveInteractions(
      InteractionModel interactionModel) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.logContact(interactionModel);
        localDataSource.cacheInteractions(interactionModel);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Countries>> getCountryData(String country) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await eKonnectRemoteDataSource.getCountry(country);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List>> getDashBoardCache() async {
    try {
      final user = await localDataSource.getUserData();
      final world = await localDataSource.getCountry("World");
      final kenya = await localDataSource.getCountry("Kenya");
      final interactions = await localDataSource.getInteractions();
      return Right([user, world, kenya, interactions]);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getCacheUser() async {
    try {
      final user = await localDataSource.getUserData();
      return Right(user);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
