// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountriesModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountriesModelAdapter extends TypeAdapter<CountriesModel> {
  @override
  final typeId = 0;

  @override
  CountriesModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountriesModel(
      country: fields[0] as String,
      cases: fields[1] as int,
      todayCases: fields[2] as int,
      deaths: fields[3] as int,
      todayDeaths: fields[4] as int,
      recovered: fields[5] as int,
      active: fields[6] as int,
      critical: fields[7] as int,
      casesPerOneMillion: fields[8] as int,
      deathsPerOneMillion: fields[9] as int,
      totalTests: fields[10] as int,
      testsPerOneMillion: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CountriesModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.cases)
      ..writeByte(2)
      ..write(obj.todayCases)
      ..writeByte(3)
      ..write(obj.deaths)
      ..writeByte(4)
      ..write(obj.todayDeaths)
      ..writeByte(5)
      ..write(obj.recovered)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.critical)
      ..writeByte(8)
      ..write(obj.casesPerOneMillion)
      ..writeByte(9)
      ..write(obj.deathsPerOneMillion)
      ..writeByte(10)
      ..write(obj.totalTests)
      ..writeByte(11)
      ..write(obj.testsPerOneMillion);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) {
  return CountriesModel(
    country: json['country'] as String,
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    casesPerOneMillion: json['casesPerOneMillion'] as int,
    deathsPerOneMillion: json['deathsPerOneMillion'] as int,
    totalTests: json['totalTests'] as int,
    testsPerOneMillion: json['testsPerOneMillion'] as int,
  );
}

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'totalTests': instance.totalTests,
      'testsPerOneMillion': instance.testsPerOneMillion,
    };
