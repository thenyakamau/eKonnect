import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/Countries.dart';
import '../repositories/EKonnectRepository.dart';

class GetCountryData extends UseCase<Countries, CountryParams> {
  final EKonnectRepository repository;

  GetCountryData({@required this.repository});
  @override
  Future<Either<Failure, Countries>> call(CountryParams params) {
    return repository.getCountryData(params.country);
  }
}

class CountryParams extends Equatable {
  final String country;

  CountryParams({@required this.country});

  @override
  List<Object> get props => [country];
}
