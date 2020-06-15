import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/UserProfile.dart';

class GetUserCacheData extends UseCase<UserProfile, NoParams> {
  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) {}
}
