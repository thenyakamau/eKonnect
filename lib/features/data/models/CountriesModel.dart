import 'package:eKonnect/features/domain/entities/Countries.dart';
import 'package:meta/meta.dart';

class CountriesModel extends Countries {
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

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      country: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json['deathsPerOneMillion'],
      totalTests: json['totalTests'],
      testsPerOneMillion: json['testsPerOneMillion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['totalTests'] = this.totalTests;
    data['testsPerOneMillion'] = this.testsPerOneMillion;
    return data;
  }
}
