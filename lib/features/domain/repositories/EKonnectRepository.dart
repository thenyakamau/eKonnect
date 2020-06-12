import 'package:dartz/dartz.dart';
import 'package:eKonnect/features/domain/entities/UserProfile.dart';

import '../../../core/errors/Failures.dart';
import '../entities/ApiSuccess.dart';

abstract class EKonnectRepository {
  Future<Either<Failure, ApiSuccess>> loginUser(UserProfile userProfile);
}
