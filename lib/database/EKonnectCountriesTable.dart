import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("CountriesTable")
class EKonnectCountriesTable extends Table {
  TextColumn get country => text().withLength(min: 1, max: 50)();

  IntColumn get cases => integer().nullable()();

  IntColumn get todayCases => integer().nullable()();

  IntColumn get deaths => integer().nullable()();

  IntColumn get todayDeaths => integer().nullable()();

  IntColumn get recovered => integer().nullable()();

  IntColumn get active => integer().nullable()();

  IntColumn get critical => integer().nullable()();

  IntColumn get casesPerOneMillion => integer().nullable()();

  IntColumn get deathsPerOneMillion => integer().nullable()();

  IntColumn get totalTests => integer().nullable()();

  IntColumn get testsPerOneMillion => integer().nullable()();

  @override
  Set<Column> get primaryKey => {country};
}
