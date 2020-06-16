import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/UserProfile.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:meta/meta.dart';

class GetUserProfile extends UseCase<UserProfile, NoParams> {
  final EKonnectRepository repository;

  GetUserProfile({@required this.repository});

  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) {
    return repository.getCacheUser();
  }
}
