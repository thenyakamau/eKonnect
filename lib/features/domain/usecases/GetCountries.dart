import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/Countries.dart';
import '../repositories/EKonnectRepository.dart';

class GetCountries extends UseCase<List<Countries>, NoParams> {
  final EKonnectRepository eKonnectRepository;

  GetCountries({@required this.eKonnectRepository});

  @override
  Future<Either<Failure, List<Countries>>> call(NoParams params) {
    return eKonnectRepository.getCountries();
  }
}
