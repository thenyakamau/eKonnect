import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/Countries.dart';
import '../repositories/EKonnectRepository.dart';

class GetCountryCache extends UseCase<Countries, CountryCacheParam> {
  final EKonnectRepository repository;

  GetCountryCache({@required this.repository});

  @override
  Future<Either<Failure, Countries>> call(CountryCacheParam params) {
    return repository.getCountryCache(params.country);
  }
}

class CountryCacheParam extends Equatable {
  final String country;

  CountryCacheParam({@required this.country});
  @override
  List<Object> get props => [country];
}
