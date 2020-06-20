import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../../data/models/UserProfileModel.dart';
import '../entities/ApiSuccess.dart';
import '../repositories/EKonnectRepository.dart';

class LoginUser extends UseCase<ApiSuccess, LoginParams> {
  final EKonnectRepository repository;

  LoginUser({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(LoginParams params) {
    return repository.loginUser(params.userProfileModel);
  }
}

class LoginParams extends Equatable {
  final UserProfileModel userProfileModel;

  LoginParams({@required this.userProfileModel});

  @override
  List<Object> get props => [userProfileModel];
}
