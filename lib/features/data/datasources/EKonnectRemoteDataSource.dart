import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:eKonnect/core/errors/Exceptions.dart';
import 'package:eKonnect/core/errors/Failures.dart';
import 'package:eKonnect/features/data/datasources/EKonnectApiService.dart';
import 'package:eKonnect/features/data/datasources/VsoftApiService.dart';
import 'package:eKonnect/features/data/models/ApiSuccessModel.dart';
import 'package:eKonnect/features/data/models/CountriesModel.dart';
import 'package:eKonnect/features/domain/entities/UserProfile.dart';
import 'package:meta/meta.dart';

abstract class EKonnectRemoteDataSource {
  Future<List<CountriesModel>> getCountriesData();
}

class EKonnectRemoteDataSourceImpl implements EKonnectRemoteDataSource {
  final EKonnectApiService eKonnectApiService;

  EKonnectRemoteDataSourceImpl({@required this.eKonnectApiService});

  @override
  Future<List<CountriesModel>> getCountriesData() async {
    final response = await eKonnectApiService.getCountriesData();

    List<CountriesModel> countries =
        (response.body as List).map((i) => CountriesModel.fromJson(i)).toList();

    if (response.statusCode == 200) {
      return countries;
    } else {
      throw ServerException();
    }
  }
}
