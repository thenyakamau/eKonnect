import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/ApiSuccessModel.dart';
import '../models/UserProfileModel.dart';
import 'VsoftApiService.dart';

abstract class VsoftRemoteDataSource {
  Future<ApiSuccessModel> loginUser(UserProfileModel userProfile);
}

class VsoftRemoteDataSourceImpl implements VsoftRemoteDataSource {
  final VsoftApiService vsoftApiService;

  VsoftRemoteDataSourceImpl({@required this.vsoftApiService});

  @override
  Future<ApiSuccessModel> loginUser(UserProfileModel userProfile) async {
    final response = await vsoftApiService.loginUser(userProfile.toJson());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
