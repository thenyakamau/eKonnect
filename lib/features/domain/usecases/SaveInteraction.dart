import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../../data/models/InteractionModel.dart';
import '../entities/ApiSuccess.dart';
import '../repositories/EKonnectRepository.dart';

class SaveInteraction extends UseCase<ApiSuccess, InteractionParams> {
  final EKonnectRepository repository;

  SaveInteraction({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(InteractionParams params) {
    return repository.saveInteractions(params.interactionModel);
  }
}

class InteractionParams extends Equatable {
  final InteractionModel interactionModel;

  InteractionParams({@required this.interactionModel});

  @override
  List<Object> get props => [interactionModel];
}
