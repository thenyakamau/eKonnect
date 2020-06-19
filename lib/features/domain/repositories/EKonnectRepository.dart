import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/InteractionModel.dart';
import '../../data/models/UserProfileModel.dart';
import '../entities/ApiSuccess.dart';
import '../entities/Countries.dart';
import '../entities/Interactions.dart';
import '../entities/UserProfile.dart';

abstract class EKonnectRepository {
  Future<Either<Failure, ApiSuccess>> loginUser(
      UserProfileModel userProfileModel);
  Future<Either<Failure, String>> getUserCounty();
  Future<Either<Failure, List<Countries>>> getCountries();
  Future<Either<Failure, ApiSuccess>> saveInteractions(
      InteractionModel interactionModel);
  Future<Either<Failure, Countries>> getCountryData(String country);
  Future<Either<Failure, List>> getDashBoardCache();
  Future<Either<Failure, Countries>> getCountryCache(String country);
  Future<Either<Failure, List<Countries>>> getCountriesCache();
  Future<Either<Failure, UserProfile>> getCacheUser();
  Future<Either<Failure, List<Interaction>>> getCacheInteraction();
}
