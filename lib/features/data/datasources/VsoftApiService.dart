import 'package:chopper/chopper.dart';

import '../models/ApiSuccessModel.dart';

part 'VsoftApiService.chopper.dart';

@ChopperApi(baseUrl: '/index.php/api/')
abstract class VsoftApiService extends ChopperService {
  @Post(path: 'contact')
  Future<Response<ApiSuccessModel>> loginUser(
    @Body() Map<String, dynamic> body,
  );
  static VsoftApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://econnect.vsoft.co.ke',
      services: [_$VsoftApiService()],
      converter: JsonConverter(),
    );
    return _$VsoftApiService(client);
  }
}
