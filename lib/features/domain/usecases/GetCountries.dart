import 'package:chopper/chopper.dart';
import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:meta/meta.dart';

class GetCountries extends UseCase<Response, NoParams> {
  final EKonnectRepository eKonnectRepository;

  GetCountries({@required this.eKonnectRepository});

  @override
  Future<Either<Failure, Response>> call(NoParams params) {
    return eKonnectRepository.getCountries();
  }
}
