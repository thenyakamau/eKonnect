import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/errors/Exceptions.dart';
import 'package:eKonnect/core/errors/Failures.dart';
import 'package:eKonnect/features/data/datasources/VsoftApiService.dart';
import 'package:eKonnect/features/data/models/ApiSuccessModel.dart';
import 'package:eKonnect/features/domain/entities/UserProfile.dart';

abstract class EKonnectRemoteDataSource {
  Future<Either<Failure, ApiSuccessModel>> loginUser(UserProfile userProfile);
}

class EKonnectRemoteDataSourceImpl implements EKonnectRemoteDataSource {
  @override
  Future<Either<Failure, ApiSuccessModel>> loginUser(
      UserProfile userProfile) async {}
}
