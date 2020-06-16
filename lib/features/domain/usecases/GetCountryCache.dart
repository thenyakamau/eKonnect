import 'package:eKonnect/core/usecases/UseCases.dart';
import 'package:eKonnect/features/domain/entities/Countries.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetCountryCache extends UseCase<Countries, CountyCacheParam> {}

class CountryCacheParam extends Equatable {
  final String country;

  CountryCacheParam({@required this.country});
  @override
  List<Object> get props => throw UnimplementedError();
}
