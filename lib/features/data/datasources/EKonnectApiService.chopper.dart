// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EKonnectApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$EKonnectApiService extends EKonnectApiService {
  _$EKonnectApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = EKonnectApiService;

  @override
  Future<Response<dynamic>> getCountriesData() {
    final $url = '/countries';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CountriesModel>> getCountryData(String country) {
    final $url = '/countries/$country';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CountriesModel, CountriesModel>($request);
  }
}
