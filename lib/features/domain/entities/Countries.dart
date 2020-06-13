import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Countries extends Equatable {
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

  Countries({
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
  }) : super();
  @override
  List<Object> get props {
    return [
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
  }
}
