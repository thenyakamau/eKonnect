import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/Countries.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
