import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';

class GetUUid extends UseCase<String, NoParams> {
  @override
  Future<Either<Failure, String>> call(NoParams params) {}
}
