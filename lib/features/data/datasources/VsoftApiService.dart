import 'package:chopper/chopper.dart';

part 'VsoftApiService.chopper.dart';

@ChopperApi(baseUrl: '/index.php/api/')
abstract class VsoftApiService extends ChopperService {
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  @Post(path: 'users')
  Future<Response> loginUser(
    @Body() Map<String, dynamic> body,
  );
  static VsoftApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://econnect.vsoft.co.ke',
        services: [_$VsoftApiService()],
        converter: JsonConverter(),
        interceptors: [
          HeadersInterceptor({'Cache-Control': 'no-cache'}),
          HttpLoggingInterceptor()
        ]);
    return _$VsoftApiService(client);
  }
}
