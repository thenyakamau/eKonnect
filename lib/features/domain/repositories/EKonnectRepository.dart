import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/CountriesModel.dart';
import '../../data/models/InteractionModel.dart';
import '../../data/models/UserProfileModel.dart';
import '../entities/ApiSuccess.dart';
import '../entities/Countries.dart';
import '../entities/UserProfile.dart';

abstract class EKonnectRepository {
  Future<Either<Failure, ApiSuccess>> loginUser(
      UserProfileModel userProfileModel);
  Future<Either<Failure, String>> getUserCounty();
  Future<Either<Failure, List<CountriesModel>>> getCountries();
  Future<Either<Failure, ApiSuccess>> saveInteractions(
      InteractionModel interactionModel);
  Future<Either<Failure, Countries>> getCountryData(String country);
  Future<Either<Failure, List>> getDashBoardCache();
  Future<Either<Failure, UserProfile>> getCacheUser();
}
