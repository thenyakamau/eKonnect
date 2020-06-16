import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/Countries.dart';

part 'CountriesModel.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CountriesModel extends Countries {
  @HiveField(0)
  final String country;
  @HiveField(1)
  final int cases;
  @HiveField(2)
  final int todayCases;
  @HiveField(3)
  final int deaths;
  @HiveField(4)
  final int todayDeaths;
  @HiveField(5)
  final int recovered;
  @HiveField(6)
  final int active;
  @HiveField(7)
  final int critical;
  @HiveField(8)
  final int casesPerOneMillion;
  @HiveField(9)
  final int deathsPerOneMillion;
  @HiveField(10)
  final int totalTests;
  @HiveField(11)
  final int testsPerOneMillion;

  CountriesModel({
    @required this.country,
    @required this.cases,
    @required this.todayCases,
    @required this.deaths,
    @required this.todayDeaths,
    @required this.recovered,
    @required this.active,
    @required this.critical,
    @required this.casesPerOneMillion,
    @required this.deathsPerOneMillion,
    @required this.totalTests,
    @required this.testsPerOneMillion,
  }) : super(
          country: country,
          cases: cases,
          todayCases: todayCases,
          deaths: deaths,
          todayDeaths: todayDeaths,
          recovered: recovered,
          active: active,
          critical: critical,
          casesPerOneMillion: casesPerOneMillion,
          deathsPerOneMillion: deathsPerOneMillion,
          totalTests: totalTests,
          testsPerOneMillion: testsPerOneMillion,
        );

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}
