import 'package:chopper/chopper.dart';
import 'package:eKonnect/features/data/models/CountriesModel.dart';

part 'EKonnectApiService.chopper.dart';

@ChopperApi(baseUrl: '/countries')
abstract class EKonnectApiService extends ChopperService {
  @Get()
  Future<Response> getCountriesData();

  @Get(path: '/{country}')
  Future<Response<CountriesModel>> getCountryData(
      @Path('country') String country);

  static EKonnectApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://coronavirus-19-api.herokuapp.com',
        services: [_$EKonnectApiService()],
        converter: JsonConverter(),
        interceptors: [
          HeadersInterceptor({'Cache-Control': 'no-cache'}),
          HttpLoggingInterceptor()
        ]);
    return _$EKonnectApiService(client);
  }
}
