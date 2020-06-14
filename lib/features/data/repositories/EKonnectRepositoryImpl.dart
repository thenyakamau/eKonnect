import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/repositories/EKonnectRepository.dart';
import '../datasources/EKonnectLocalDataSource.dart';
import '../datasources/EKonnectRemoteDataSource.dart';
import '../datasources/VsoftRemoteDataSource.dart';
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
  Future<Either<Failure, Response>> getCountries() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await eKonnectRemoteDataSource.getCountriesData();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> loginUser(
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
      // try {
      //   final cachedUser = await localDataSource.getUserData();
      //   return Right(cachedUser);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      return Left(ServerFailure());
    }
  }
}
