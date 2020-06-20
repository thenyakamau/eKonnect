// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EKonnectDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CountriesTable extends DataClass implements Insertable<CountriesTable> {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int totalTests;
  final int testsPerOneMillion;
  CountriesTable(
      {@required this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});
  factory CountriesTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return CountriesTable(
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      cases: intType.mapFromDatabaseResponse(data['${effectivePrefix}cases']),
      todayCases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}today_cases']),
      deaths: intType.mapFromDatabaseResponse(data['${effectivePrefix}deaths']),
      todayDeaths: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}today_deaths']),
      recovered:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}recovered']),
      active: intType.mapFromDatabaseResponse(data['${effectivePrefix}active']),
      critical:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}critical']),
      casesPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}cases_per_one_million']),
      deathsPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}deaths_per_one_million']),
      totalTests: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_tests']),
      testsPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}tests_per_one_million']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || cases != null) {
      map['cases'] = Variable<int>(cases);
    }
    if (!nullToAbsent || todayCases != null) {
      map['today_cases'] = Variable<int>(todayCases);
    }
    if (!nullToAbsent || deaths != null) {
      map['deaths'] = Variable<int>(deaths);
    }
    if (!nullToAbsent || todayDeaths != null) {
      map['today_deaths'] = Variable<int>(todayDeaths);
    }
    if (!nullToAbsent || recovered != null) {
      map['recovered'] = Variable<int>(recovered);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    if (!nullToAbsent || critical != null) {
      map['critical'] = Variable<int>(critical);
    }
    if (!nullToAbsent || casesPerOneMillion != null) {
      map['cases_per_one_million'] = Variable<int>(casesPerOneMillion);
    }
    if (!nullToAbsent || deathsPerOneMillion != null) {
      map['deaths_per_one_million'] = Variable<int>(deathsPerOneMillion);
    }
    if (!nullToAbsent || totalTests != null) {
      map['total_tests'] = Variable<int>(totalTests);
    }
    if (!nullToAbsent || testsPerOneMillion != null) {
      map['tests_per_one_million'] = Variable<int>(testsPerOneMillion);
    }
    return map;
  }

  EKonnectCountriesTableCompanion toCompanion(bool nullToAbsent) {
    return EKonnectCountriesTableCompanion(
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      cases:
          cases == null && nullToAbsent ? const Value.absent() : Value(cases),
      todayCases: todayCases == null && nullToAbsent
          ? const Value.absent()
          : Value(todayCases),
      deaths:
          deaths == null && nullToAbsent ? const Value.absent() : Value(deaths),
      todayDeaths: todayDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(todayDeaths),
      recovered: recovered == null && nullToAbsent
          ? const Value.absent()
          : Value(recovered),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
      critical: critical == null && nullToAbsent
          ? const Value.absent()
          : Value(critical),
      casesPerOneMillion: casesPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(casesPerOneMillion),
      deathsPerOneMillion: deathsPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(deathsPerOneMillion),
      totalTests: totalTests == null && nullToAbsent
          ? const Value.absent()
          : Value(totalTests),
      testsPerOneMillion: testsPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(testsPerOneMillion),
    );
  }

  factory CountriesTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountriesTable(
      country: serializer.fromJson<String>(json['country']),
      cases: serializer.fromJson<int>(json['cases']),
      todayCases: serializer.fromJson<int>(json['todayCases']),
      deaths: serializer.fromJson<int>(json['deaths']),
      todayDeaths: serializer.fromJson<int>(json['todayDeaths']),
      recovered: serializer.fromJson<int>(json['recovered']),
      active: serializer.fromJson<int>(json['active']),
      critical: serializer.fromJson<int>(json['critical']),
      casesPerOneMillion: serializer.fromJson<int>(json['casesPerOneMillion']),
      deathsPerOneMillion:
          serializer.fromJson<int>(json['deathsPerOneMillion']),
      totalTests: serializer.fromJson<int>(json['totalTests']),
      testsPerOneMillion: serializer.fromJson<int>(json['testsPerOneMillion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'country': serializer.toJson<String>(country),
      'cases': serializer.toJson<int>(cases),
      'todayCases': serializer.toJson<int>(todayCases),
      'deaths': serializer.toJson<int>(deaths),
      'todayDeaths': serializer.toJson<int>(todayDeaths),
      'recovered': serializer.toJson<int>(recovered),
      'active': serializer.toJson<int>(active),
      'critical': serializer.toJson<int>(critical),
      'casesPerOneMillion': serializer.toJson<int>(casesPerOneMillion),
      'deathsPerOneMillion': serializer.toJson<int>(deathsPerOneMillion),
      'totalTests': serializer.toJson<int>(totalTests),
      'testsPerOneMillion': serializer.toJson<int>(testsPerOneMillion),
    };
  }

  CountriesTable copyWith(
          {String country,
          int cases,
          int todayCases,
          int deaths,
          int todayDeaths,
          int recovered,
          int active,
          int critical,
          int casesPerOneMillion,
          int deathsPerOneMillion,
          int totalTests,
          int testsPerOneMillion}) =>
      CountriesTable(
        country: country ?? this.country,
        cases: cases ?? this.cases,
        todayCases: todayCases ?? this.todayCases,
        deaths: deaths ?? this.deaths,
        todayDeaths: todayDeaths ?? this.todayDeaths,
        recovered: recovered ?? this.recovered,
        active: active ?? this.active,
        critical: critical ?? this.critical,
        casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
        deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
        totalTests: totalTests ?? this.totalTests,
        testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
      );
  @override
  String toString() {
    return (StringBuffer('CountriesTable(')
          ..write('country: $country, ')
          ..write('cases: $cases, ')
          ..write('todayCases: $todayCases, ')
          ..write('deaths: $deaths, ')
          ..write('todayDeaths: $todayDeaths, ')
          ..write('recovered: $recovered, ')
          ..write('active: $active, ')
          ..write('critical: $critical, ')
          ..write('casesPerOneMillion: $casesPerOneMillion, ')
          ..write('deathsPerOneMillion: $deathsPerOneMillion, ')
          ..write('totalTests: $totalTests, ')
          ..write('testsPerOneMillion: $testsPerOneMillion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      country.hashCode,
      $mrjc(
          cases.hashCode,
          $mrjc(
              todayCases.hashCode,
              $mrjc(
                  deaths.hashCode,
                  $mrjc(
                      todayDeaths.hashCode,
                      $mrjc(
                          recovered.hashCode,
                          $mrjc(
                              active.hashCode,
                              $mrjc(
                                  critical.hashCode,
                                  $mrjc(
                                      casesPerOneMillion.hashCode,
                                      $mrjc(
                                          deathsPerOneMillion.hashCode,
                                          $mrjc(
                                              totalTests.hashCode,
                                              testsPerOneMillion
                                                  .hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CountriesTable &&
          other.country == this.country &&
          other.cases == this.cases &&
          other.todayCases == this.todayCases &&
          other.deaths == this.deaths &&
          other.todayDeaths == this.todayDeaths &&
          other.recovered == this.recovered &&
          other.active == this.active &&
          other.critical == this.critical &&
          other.casesPerOneMillion == this.casesPerOneMillion &&
          other.deathsPerOneMillion == this.deathsPerOneMillion &&
          other.totalTests == this.totalTests &&
          other.testsPerOneMillion == this.testsPerOneMillion);
}

class EKonnectCountriesTableCompanion extends UpdateCompanion<CountriesTable> {
  final Value<String> country;
  final Value<int> cases;
  final Value<int> todayCases;
  final Value<int> deaths;
  final Value<int> todayDeaths;
  final Value<int> recovered;
  final Value<int> active;
  final Value<int> critical;
  final Value<int> casesPerOneMillion;
  final Value<int> deathsPerOneMillion;
  final Value<int> totalTests;
  final Value<int> testsPerOneMillion;
  const EKonnectCountriesTableCompanion({
    this.country = const Value.absent(),
    this.cases = const Value.absent(),
    this.todayCases = const Value.absent(),
    this.deaths = const Value.absent(),
    this.todayDeaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.active = const Value.absent(),
    this.critical = const Value.absent(),
    this.casesPerOneMillion = const Value.absent(),
    this.deathsPerOneMillion = const Value.absent(),
    this.totalTests = const Value.absent(),
    this.testsPerOneMillion = const Value.absent(),
  });
  EKonnectCountriesTableCompanion.insert({
    @required String country,
    this.cases = const Value.absent(),
    this.todayCases = const Value.absent(),
    this.deaths = const Value.absent(),
    this.todayDeaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.active = const Value.absent(),
    this.critical = const Value.absent(),
    this.casesPerOneMillion = const Value.absent(),
    this.deathsPerOneMillion = const Value.absent(),
    this.totalTests = const Value.absent(),
    this.testsPerOneMillion = const Value.absent(),
  }) : country = Value(country);
  static Insertable<CountriesTable> custom({
    Expression<String> country,
    Expression<int> cases,
    Expression<int> todayCases,
    Expression<int> deaths,
    Expression<int> todayDeaths,
    Expression<int> recovered,
    Expression<int> active,
    Expression<int> critical,
    Expression<int> casesPerOneMillion,
    Expression<int> deathsPerOneMillion,
    Expression<int> totalTests,
    Expression<int> testsPerOneMillion,
  }) {
    return RawValuesInsertable({
      if (country != null) 'country': country,
      if (cases != null) 'cases': cases,
      if (todayCases != null) 'today_cases': todayCases,
      if (deaths != null) 'deaths': deaths,
      if (todayDeaths != null) 'today_deaths': todayDeaths,
      if (recovered != null) 'recovered': recovered,
      if (active != null) 'active': active,
      if (critical != null) 'critical': critical,
      if (casesPerOneMillion != null)
        'cases_per_one_million': casesPerOneMillion,
      if (deathsPerOneMillion != null)
        'deaths_per_one_million': deathsPerOneMillion,
      if (totalTests != null) 'total_tests': totalTests,
      if (testsPerOneMillion != null)
        'tests_per_one_million': testsPerOneMillion,
    });
  }

  EKonnectCountriesTableCompanion copyWith(
      {Value<String> country,
      Value<int> cases,
      Value<int> todayCases,
      Value<int> deaths,
      Value<int> todayDeaths,
      Value<int> recovered,
      Value<int> active,
      Value<int> critical,
      Value<int> casesPerOneMillion,
      Value<int> deathsPerOneMillion,
      Value<int> totalTests,
      Value<int> testsPerOneMillion}) {
    return EKonnectCountriesTableCompanion(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      recovered: recovered ?? this.recovered,
      active: active ?? this.active,
      critical: critical ?? this.critical,
      casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
      deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
      totalTests: totalTests ?? this.totalTests,
      testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (cases.present) {
      map['cases'] = Variable<int>(cases.value);
    }
    if (todayCases.present) {
      map['today_cases'] = Variable<int>(todayCases.value);
    }
    if (deaths.present) {
      map['deaths'] = Variable<int>(deaths.value);
    }
    if (todayDeaths.present) {
      map['today_deaths'] = Variable<int>(todayDeaths.value);
    }
    if (recovered.present) {
      map['recovered'] = Variable<int>(recovered.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (casesPerOneMillion.present) {
      map['cases_per_one_million'] = Variable<int>(casesPerOneMillion.value);
    }
    if (deathsPerOneMillion.present) {
      map['deaths_per_one_million'] = Variable<int>(deathsPerOneMillion.value);
    }
    if (totalTests.present) {
      map['total_tests'] = Variable<int>(totalTests.value);
    }
    if (testsPerOneMillion.present) {
      map['tests_per_one_million'] = Variable<int>(testsPerOneMillion.value);
    }
    return map;
  }
}

class $EKonnectCountriesTableTable extends EKonnectCountriesTable
    with TableInfo<$EKonnectCountriesTableTable, CountriesTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $EKonnectCountriesTableTable(this._db, [this._alias]);
  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn('country', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _casesMeta = const VerificationMeta('cases');
  GeneratedIntColumn _cases;
  @override
  GeneratedIntColumn get cases => _cases ??= _constructCases();
  GeneratedIntColumn _constructCases() {
    return GeneratedIntColumn(
      'cases',
      $tableName,
      true,
    );
  }

  final VerificationMeta _todayCasesMeta = const VerificationMeta('todayCases');
  GeneratedIntColumn _todayCases;
  @override
  GeneratedIntColumn get todayCases => _todayCases ??= _constructTodayCases();
  GeneratedIntColumn _constructTodayCases() {
    return GeneratedIntColumn(
      'today_cases',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deathsMeta = const VerificationMeta('deaths');
  GeneratedIntColumn _deaths;
  @override
  GeneratedIntColumn get deaths => _deaths ??= _constructDeaths();
  GeneratedIntColumn _constructDeaths() {
    return GeneratedIntColumn(
      'deaths',
      $tableName,
      true,
    );
  }

  final VerificationMeta _todayDeathsMeta =
      const VerificationMeta('todayDeaths');
  GeneratedIntColumn _todayDeaths;
  @override
  GeneratedIntColumn get todayDeaths =>
      _todayDeaths ??= _constructTodayDeaths();
  GeneratedIntColumn _constructTodayDeaths() {
    return GeneratedIntColumn(
      'today_deaths',
      $tableName,
      true,
    );
  }

  final VerificationMeta _recoveredMeta = const VerificationMeta('recovered');
  GeneratedIntColumn _recovered;
  @override
  GeneratedIntColumn get recovered => _recovered ??= _constructRecovered();
  GeneratedIntColumn _constructRecovered() {
    return GeneratedIntColumn(
      'recovered',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedIntColumn _active;
  @override
  GeneratedIntColumn get active => _active ??= _constructActive();
  GeneratedIntColumn _constructActive() {
    return GeneratedIntColumn(
      'active',
      $tableName,
      true,
    );
  }

  final VerificationMeta _criticalMeta = const VerificationMeta('critical');
  GeneratedIntColumn _critical;
  @override
  GeneratedIntColumn get critical => _critical ??= _constructCritical();
  GeneratedIntColumn _constructCritical() {
    return GeneratedIntColumn(
      'critical',
      $tableName,
      true,
    );
  }

  final VerificationMeta _casesPerOneMillionMeta =
      const VerificationMeta('casesPerOneMillion');
  GeneratedIntColumn _casesPerOneMillion;
  @override
  GeneratedIntColumn get casesPerOneMillion =>
      _casesPerOneMillion ??= _constructCasesPerOneMillion();
  GeneratedIntColumn _constructCasesPerOneMillion() {
    return GeneratedIntColumn(
      'cases_per_one_million',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deathsPerOneMillionMeta =
      const VerificationMeta('deathsPerOneMillion');
  GeneratedIntColumn _deathsPerOneMillion;
  @override
  GeneratedIntColumn get deathsPerOneMillion =>
      _deathsPerOneMillion ??= _constructDeathsPerOneMillion();
  GeneratedIntColumn _constructDeathsPerOneMillion() {
    return GeneratedIntColumn(
      'deaths_per_one_million',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalTestsMeta = const VerificationMeta('totalTests');
  GeneratedIntColumn _totalTests;
  @override
  GeneratedIntColumn get totalTests => _totalTests ??= _constructTotalTests();
  GeneratedIntColumn _constructTotalTests() {
    return GeneratedIntColumn(
      'total_tests',
      $tableName,
      true,
    );
  }

  final VerificationMeta _testsPerOneMillionMeta =
      const VerificationMeta('testsPerOneMillion');
  GeneratedIntColumn _testsPerOneMillion;
  @override
  GeneratedIntColumn get testsPerOneMillion =>
      _testsPerOneMillion ??= _constructTestsPerOneMillion();
  GeneratedIntColumn _constructTestsPerOneMillion() {
    return GeneratedIntColumn(
      'tests_per_one_million',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        country,
        cases,
        todayCases,
        deaths,
        todayDeaths,
        recovered,
        active,
        critical,
        casesPerOneMillion,
        deathsPerOneMillion,
        totalTests,
        testsPerOneMillion
      ];
  @override
  $EKonnectCountriesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'e_konnect_countries_table';
  @override
  final String actualTableName = 'e_konnect_countries_table';
  @override
  VerificationContext validateIntegrity(Insertable<CountriesTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('cases')) {
      context.handle(
          _casesMeta, cases.isAcceptableOrUnknown(data['cases'], _casesMeta));
    }
    if (data.containsKey('today_cases')) {
      context.handle(
          _todayCasesMeta,
          todayCases.isAcceptableOrUnknown(
              data['today_cases'], _todayCasesMeta));
    }
    if (data.containsKey('deaths')) {
      context.handle(_deathsMeta,
          deaths.isAcceptableOrUnknown(data['deaths'], _deathsMeta));
    }
    if (data.containsKey('today_deaths')) {
      context.handle(
          _todayDeathsMeta,
          todayDeaths.isAcceptableOrUnknown(
              data['today_deaths'], _todayDeathsMeta));
    }
    if (data.containsKey('recovered')) {
      context.handle(_recoveredMeta,
          recovered.isAcceptableOrUnknown(data['recovered'], _recoveredMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active'], _activeMeta));
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical'], _criticalMeta));
    }
    if (data.containsKey('cases_per_one_million')) {
      context.handle(
          _casesPerOneMillionMeta,
          casesPerOneMillion.isAcceptableOrUnknown(
              data['cases_per_one_million'], _casesPerOneMillionMeta));
    }
    if (data.containsKey('deaths_per_one_million')) {
      context.handle(
          _deathsPerOneMillionMeta,
          deathsPerOneMillion.isAcceptableOrUnknown(
              data['deaths_per_one_million'], _deathsPerOneMillionMeta));
    }
    if (data.containsKey('total_tests')) {
      context.handle(
          _totalTestsMeta,
          totalTests.isAcceptableOrUnknown(
              data['total_tests'], _totalTestsMeta));
    }
    if (data.containsKey('tests_per_one_million')) {
      context.handle(
          _testsPerOneMillionMeta,
          testsPerOneMillion.isAcceptableOrUnknown(
              data['tests_per_one_million'], _testsPerOneMillionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {country};
  @override
  CountriesTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CountriesTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EKonnectCountriesTableTable createAlias(String alias) {
    return $EKonnectCountriesTableTable(_db, alias);
  }
}

class InteractionsTable extends DataClass
    implements Insertable<InteractionsTable> {
  final String date;
  final String from_contact;
  final String to_contact;
  final String location;
  final String latitude;
  final String longtitude;
  InteractionsTable(
      {@required this.date,
      @required this.from_contact,
      @required this.to_contact,
      @required this.location,
      @required this.latitude,
      @required this.longtitude});
  factory InteractionsTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return InteractionsTable(
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      from_contact: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}from_contact']),
      to_contact: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}to_contact']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      latitude: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longtitude: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}longtitude']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || from_contact != null) {
      map['from_contact'] = Variable<String>(from_contact);
    }
    if (!nullToAbsent || to_contact != null) {
      map['to_contact'] = Variable<String>(to_contact);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String>(latitude);
    }
    if (!nullToAbsent || longtitude != null) {
      map['longtitude'] = Variable<String>(longtitude);
    }
    return map;
  }

  EKonnectInteractionsTableCompanion toCompanion(bool nullToAbsent) {
    return EKonnectInteractionsTableCompanion(
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      from_contact: from_contact == null && nullToAbsent
          ? const Value.absent()
          : Value(from_contact),
      to_contact: to_contact == null && nullToAbsent
          ? const Value.absent()
          : Value(to_contact),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longtitude: longtitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longtitude),
    );
  }

  factory InteractionsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InteractionsTable(
      date: serializer.fromJson<String>(json['date']),
      from_contact: serializer.fromJson<String>(json['from_contact']),
      to_contact: serializer.fromJson<String>(json['to_contact']),
      location: serializer.fromJson<String>(json['location']),
      latitude: serializer.fromJson<String>(json['latitude']),
      longtitude: serializer.fromJson<String>(json['longtitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'from_contact': serializer.toJson<String>(from_contact),
      'to_contact': serializer.toJson<String>(to_contact),
      'location': serializer.toJson<String>(location),
      'latitude': serializer.toJson<String>(latitude),
      'longtitude': serializer.toJson<String>(longtitude),
    };
  }

  InteractionsTable copyWith(
          {String date,
          String from_contact,
          String to_contact,
          String location,
          String latitude,
          String longtitude}) =>
      InteractionsTable(
        date: date ?? this.date,
        from_contact: from_contact ?? this.from_contact,
        to_contact: to_contact ?? this.to_contact,
        location: location ?? this.location,
        latitude: latitude ?? this.latitude,
        longtitude: longtitude ?? this.longtitude,
      );
  @override
  String toString() {
    return (StringBuffer('InteractionsTable(')
          ..write('date: $date, ')
          ..write('from_contact: $from_contact, ')
          ..write('to_contact: $to_contact, ')
          ..write('location: $location, ')
          ..write('latitude: $latitude, ')
          ..write('longtitude: $longtitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      date.hashCode,
      $mrjc(
          from_contact.hashCode,
          $mrjc(
              to_contact.hashCode,
              $mrjc(location.hashCode,
                  $mrjc(latitude.hashCode, longtitude.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InteractionsTable &&
          other.date == this.date &&
          other.from_contact == this.from_contact &&
          other.to_contact == this.to_contact &&
          other.location == this.location &&
          other.latitude == this.latitude &&
          other.longtitude == this.longtitude);
}

class EKonnectInteractionsTableCompanion
    extends UpdateCompanion<InteractionsTable> {
  final Value<String> date;
  final Value<String> from_contact;
  final Value<String> to_contact;
  final Value<String> location;
  final Value<String> latitude;
  final Value<String> longtitude;
  const EKonnectInteractionsTableCompanion({
    this.date = const Value.absent(),
    this.from_contact = const Value.absent(),
    this.to_contact = const Value.absent(),
    this.location = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longtitude = const Value.absent(),
  });
  EKonnectInteractionsTableCompanion.insert({
    @required String date,
    @required String from_contact,
    @required String to_contact,
    @required String location,
    @required String latitude,
    @required String longtitude,
  })  : date = Value(date),
        from_contact = Value(from_contact),
        to_contact = Value(to_contact),
        location = Value(location),
        latitude = Value(latitude),
        longtitude = Value(longtitude);
  static Insertable<InteractionsTable> custom({
    Expression<String> date,
    Expression<String> from_contact,
    Expression<String> to_contact,
    Expression<String> location,
    Expression<String> latitude,
    Expression<String> longtitude,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (from_contact != null) 'from_contact': from_contact,
      if (to_contact != null) 'to_contact': to_contact,
      if (location != null) 'location': location,
      if (latitude != null) 'latitude': latitude,
      if (longtitude != null) 'longtitude': longtitude,
    });
  }

  EKonnectInteractionsTableCompanion copyWith(
      {Value<String> date,
      Value<String> from_contact,
      Value<String> to_contact,
      Value<String> location,
      Value<String> latitude,
      Value<String> longtitude}) {
    return EKonnectInteractionsTableCompanion(
      date: date ?? this.date,
      from_contact: from_contact ?? this.from_contact,
      to_contact: to_contact ?? this.to_contact,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longtitude: longtitude ?? this.longtitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (from_contact.present) {
      map['from_contact'] = Variable<String>(from_contact.value);
    }
    if (to_contact.present) {
      map['to_contact'] = Variable<String>(to_contact.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (longtitude.present) {
      map['longtitude'] = Variable<String>(longtitude.value);
    }
    return map;
  }
}

class $EKonnectInteractionsTableTable extends EKonnectInteractionsTable
    with TableInfo<$EKonnectInteractionsTableTable, InteractionsTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $EKonnectInteractionsTableTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _from_contactMeta =
      const VerificationMeta('from_contact');
  GeneratedTextColumn _from_contact;
  @override
  GeneratedTextColumn get from_contact =>
      _from_contact ??= _constructFromContact();
  GeneratedTextColumn _constructFromContact() {
    return GeneratedTextColumn('from_contact', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _to_contactMeta = const VerificationMeta('to_contact');
  GeneratedTextColumn _to_contact;
  @override
  GeneratedTextColumn get to_contact => _to_contact ??= _constructToContact();
  GeneratedTextColumn _constructToContact() {
    return GeneratedTextColumn('to_contact', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn('location', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedTextColumn _latitude;
  @override
  GeneratedTextColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedTextColumn _constructLatitude() {
    return GeneratedTextColumn('latitude', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _longtitudeMeta = const VerificationMeta('longtitude');
  GeneratedTextColumn _longtitude;
  @override
  GeneratedTextColumn get longtitude => _longtitude ??= _constructLongtitude();
  GeneratedTextColumn _constructLongtitude() {
    return GeneratedTextColumn('longtitude', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [date, from_contact, to_contact, location, latitude, longtitude];
  @override
  $EKonnectInteractionsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'e_konnect_interactions_table';
  @override
  final String actualTableName = 'e_konnect_interactions_table';
  @override
  VerificationContext validateIntegrity(Insertable<InteractionsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('from_contact')) {
      context.handle(
          _from_contactMeta,
          from_contact.isAcceptableOrUnknown(
              data['from_contact'], _from_contactMeta));
    } else if (isInserting) {
      context.missing(_from_contactMeta);
    }
    if (data.containsKey('to_contact')) {
      context.handle(
          _to_contactMeta,
          to_contact.isAcceptableOrUnknown(
              data['to_contact'], _to_contactMeta));
    } else if (isInserting) {
      context.missing(_to_contactMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longtitude')) {
      context.handle(
          _longtitudeMeta,
          longtitude.isAcceptableOrUnknown(
              data['longtitude'], _longtitudeMeta));
    } else if (isInserting) {
      context.missing(_longtitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InteractionsTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InteractionsTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EKonnectInteractionsTableTable createAlias(String alias) {
    return $EKonnectInteractionsTableTable(_db, alias);
  }
}

abstract class _$EKonnectDatabase extends GeneratedDatabase {
  _$EKonnectDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $EKonnectCountriesTableTable _eKonnectCountriesTable;
  $EKonnectCountriesTableTable get eKonnectCountriesTable =>
      _eKonnectCountriesTable ??= $EKonnectCountriesTableTable(this);
  $EKonnectInteractionsTableTable _eKonnectInteractionsTable;
  $EKonnectInteractionsTableTable get eKonnectInteractionsTable =>
      _eKonnectInteractionsTable ??= $EKonnectInteractionsTableTable(this);
  EKonnectDao _eKonnectDao;
  EKonnectDao get eKonnectDao =>
      _eKonnectDao ??= EKonnectDao(this as EKonnectDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [eKonnectCountriesTable, eKonnectInteractionsTable];
}
