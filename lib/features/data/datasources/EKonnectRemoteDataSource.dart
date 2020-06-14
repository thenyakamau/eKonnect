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
  Future<Response> getCountriesData();
}

class EKonnectRemoteDataSourceImpl implements EKonnectRemoteDataSource {
  final EKonnectApiService eKonnectApiService;

  EKonnectRemoteDataSourceImpl({@required this.eKonnectApiService});

  @override
  Future<Response> getCountriesData() async {
    final response = await eKonnectApiService.getCountriesData();

    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException();
    }
  }
}
