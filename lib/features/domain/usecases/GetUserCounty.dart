import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:meta/meta.dart';

class GetUserCounty extends UseCase<String, NoParams> {
  final EKonnectRepository eKonnectRepository;

  GetUserCounty({@required this.eKonnectRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return eKonnectRepository.getUserCounty();
  }
}
