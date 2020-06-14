import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/ApiSuccessModel.dart';
import '../models/UserProfileModel.dart';
import 'VsoftApiService.dart';

abstract class VsoftRemoteDataSource {
  Future<Response> loginUser(UserProfileModel userProfile);
}

class VsoftRemoteDataSourceImpl implements VsoftRemoteDataSource {
  final VsoftApiService vsoftApiService;

  VsoftRemoteDataSourceImpl({@required this.vsoftApiService});

  @override
  Future<Response> loginUser(UserProfileModel userProfile) async {
    final response = await vsoftApiService.loginUser(userProfile.toJson());
    print(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException();
    }
  }
}
