import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/CountriesModel.dart';
import 'EKonnectApiService.dart';

abstract class EKonnectRemoteDataSource {
  Future<List<CountriesModel>> getCountriesData();
  Future<CountriesModel> getCountry(String country);
}

class EKonnectRemoteDataSourceImpl implements EKonnectRemoteDataSource {
  final EKonnectApiService eKonnectApiService;

  EKonnectRemoteDataSourceImpl({@required this.eKonnectApiService});

  @override
  Future<List<CountriesModel>> getCountriesData() async {
    final response = await eKonnectApiService.getCountriesData();

    if (response.statusCode == 200) {
      List<CountriesModel> countries = (response.body as List)
          .map((i) => CountriesModel.fromJson(i))
          .toList();
      return countries;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CountriesModel> getCountry(String country) async {
    final response = await eKonnectApiService.getCountryData(country);
    if (response.statusCode == 200) {
      CountriesModel countriesModel = CountriesModel.fromJson(response.body);
      return countriesModel;
    } else {
      throw ServerException();
    }
  }
}
