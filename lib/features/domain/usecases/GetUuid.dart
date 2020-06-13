import 'package:meta/meta.dart';

import '../../../core/usecases/UseCases.dart';
import '../../data/datasources/EKonnectLocalDataSource.dart';

class GetUUid {
  final EKonnectLocalDataSource localDataSource;

  GetUUid({@required this.localDataSource});

  Future<String> call(NoParams params) async {
    String uuid = await localDataSource.getUUid();
    return uuid;
  }
}
