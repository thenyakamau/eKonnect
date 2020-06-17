import 'package:eKonnect/core/errors/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/Countries.dart';
import 'package:eKonnect/features/domain/repositories/EKonnectRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
