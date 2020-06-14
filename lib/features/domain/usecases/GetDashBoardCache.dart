import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../repositories/EKonnectRepository.dart';

class GetDashBoardCache extends UseCase<List, NoParams> {
  final EKonnectRepository repository;

  GetDashBoardCache({@required this.repository});

  @override
  Future<Either<Failure, List>> call(NoParams params) {
    return repository.getDashBoardCache();
  }
}
