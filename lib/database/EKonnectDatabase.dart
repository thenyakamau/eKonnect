import 'package:eKonnect/database/EkonnectInteractionsTable.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'EKonnectCountriesTable.dart';
import 'EKonnectDAO.dart';

part 'EKonnectDatabase.g.dart';

@UseMoor(
  tables: [EKonnectCountriesTable, EKonnectInteractionsTable],
  daos: [EKonnectDao],
)
class EKonnectDatabase extends _$EKonnectDatabase {
  EKonnectDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          )),
        );

  @override
  int get schemaVersion => 1;
}
