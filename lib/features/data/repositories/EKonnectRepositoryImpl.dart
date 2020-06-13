import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../../../core/errors/Failures.dart';
import '../../../core/network/NetworkInfo.dart';
import '../../domain/entities/ApiSuccess.dart';
import '../../domain/entities/UserProfile.dart';
import '../../domain/repositories/EKonnectRepository.dart';
import '../datasources/EKonnectLocalDataSource.dart';
import '../datasources/VsoftRemoteDataSource.dart';

class EKonnectRepositoryImpl implements EKonnectRepository {
  final EKonnectLocalDataSource localDataSource;
  final VsoftRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EKonnectRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, ApiSuccess>> loginUser(UserProfile userProfile) async {
    if (await networkInfo.isConnected) {
      try {
        final loginUser = await remoteDataSource.loginUser(userProfile);
        localDataSource.cacheUser(userProfile);
        return Right(loginUser);
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
}
