import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/features/data/models/CountriesModel.dart';
import 'package:eKonnect/features/domain/entities/ApiSuccess.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/ApiSuccessModel.dart';
import '../../data/models/UserProfileModel.dart';

abstract class EKonnectRepository {
  Future<Either<Failure, ApiSuccess>> loginUser(
      UserProfileModel userProfileModel);
  Future<Either<Failure, String>> getUserCounty();
  //Future<Either<Failure, Response>> getCountries();
  Future<Either<Failure, List<CountriesModel>>> getCountries();
}
