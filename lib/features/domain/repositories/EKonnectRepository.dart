import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/ApiSuccessModel.dart';
import '../../data/models/UserProfileModel.dart';

abstract class EKonnectRepository {
  Future<Either<Failure, Response>> loginUser(
    UserProfileModel userProfileModel,
  );
  Future<Either<Failure, String>> getUserCounty();
  Future<Either<Failure, Response>> getCountries();
}
