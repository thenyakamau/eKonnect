import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/Interactions.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:meta/meta.dart';

class GetInteractionsCache extends UseCase<List<Interaction>, NoParams> {
  final EKonnectRepository repository;

  GetInteractionsCache({@required this.repository});

  @override
  Future<Either<Failure, List<Interaction>>> call(NoParams params) {
    return repository.getCacheInteraction();
  }
}
