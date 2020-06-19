import 'package:eKonnect/database/EKonnectCountriesTable.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'EKonnectDatabase.dart';

part 'EKonnectDAO.g.dart';

// abstract class EKonnectDAO {
//   Future<List<CountriesTable>> getCountries();
//   Future insertCountry(CountriesTable countriesTable);
// }

@UseDao(tables: [EKonnectCountriesTable])
class EKonnectDao extends DatabaseAccessor<EKonnectDatabase>
    with _$EKonnectDaoMixin {
  EKonnectDao(EKonnectDatabase db) : super(db);

  Future<List<CountriesTable>> getCountries() =>
      select(eKonnectCountriesTable).get();

  Future insertCountry(CountriesTable countriesTable) =>
      into(eKonnectCountriesTable).insert(countriesTable);

  Future deleteAll() => delete(eKonnectCountriesTable).go();
}
