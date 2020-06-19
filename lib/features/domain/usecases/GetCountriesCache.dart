import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/Countries.dart';
import 'package:meta/meta.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';

class GetCountriesCache extends UseCase<List<Countries>, NoParams> {
  final EKonnectRepository repository;

  GetCountriesCache({@required this.repository});

  @override
  Future<Either<Failure, List<Countries>>> call(NoParams params) {
    return repository.getCountriesCache();
  }
}
