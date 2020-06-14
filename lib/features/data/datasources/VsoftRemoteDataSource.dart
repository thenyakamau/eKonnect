import 'package:meta/meta.dart';

import '../../../core/errors/Exceptions.dart';
import '../models/ApiSuccessModel.dart';
import '../models/InteractionModel.dart';
import '../models/UserProfileModel.dart';
import 'VsoftApiService.dart';

abstract class VsoftRemoteDataSource {
  Future<ApiSuccessModel> loginUser(UserProfileModel userProfile);
  Future<ApiSuccessModel> logContact(InteractionModel interactionModel);
}

class VsoftRemoteDataSourceImpl implements VsoftRemoteDataSource {
  final VsoftApiService vsoftApiService;

  VsoftRemoteDataSourceImpl({@required this.vsoftApiService});

  @override
  Future<ApiSuccessModel> loginUser(UserProfileModel userProfile) async {
    final response = await vsoftApiService.loginUser(userProfile.toJson());

    if (response.statusCode == 200) {
      var result = ApiSuccessModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ApiSuccessModel> logContact(InteractionModel interactionModel) async {
    final response =
        await vsoftApiService.logContact(interactionModel.toJson());
    if (response.statusCode == 200) {
      var result = ApiSuccessModel.fromJson(response.body);
      return result;
    } else {
      throw ServerException();
    }
  }
}
