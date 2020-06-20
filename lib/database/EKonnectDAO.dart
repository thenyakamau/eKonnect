import 'package:moor_flutter/moor_flutter.dart';

import 'EKonnectCountriesTable.dart';
import 'EKonnectDatabase.dart';
import 'EkonnectInteractionsTable.dart';

part 'EKonnectDAO.g.dart';

@UseDao(tables: [EKonnectCountriesTable, EKonnectInteractionsTable])
class EKonnectDao extends DatabaseAccessor<EKonnectDatabase>
    with _$EKonnectDaoMixin {
  EKonnectDao(EKonnectDatabase db) : super(db);

  Future<List<CountriesTable>> getCountries() =>
      select(eKonnectCountriesTable).get();

  Future<List<CountriesTable>> getCountry(String country) {
    return (select(eKonnectCountriesTable)
          ..where((t) => t.country.equals(country)))
        .get();
  }

  Future insertCountry(CountriesTable countriesTable) =>
      into(eKonnectCountriesTable).insert(countriesTable);

  Future deleteAll() => delete(eKonnectCountriesTable).go();

  Future<List<InteractionsTable>> getInteractions() =>
      select(eKonnectInteractionsTable).get();

  Future insertInteraction(InteractionsTable interactionsTable) =>
      into(eKonnectInteractionsTable).insert(interactionsTable);

  Future deleteAllInteractions() => delete(eKonnectInteractionsTable).go();
}
