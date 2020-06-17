import 'package:eKonnect/features/data/models/CountriesModel.dart';
import 'package:eKonnect/features/data/models/InteractionModel.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

abstract class EKonnectInteractions {
  Future<void> saveInteraction(InteractionModel interactionModel);
  Future<List<InteractionModel>> getInteractions();
  Future<void> saveCountries(List<CountriesModel> countries);
  Future<List<CountriesModel>> getCountries();
  Future<CountriesModel> getCountry(String country);
}

class EKonnectInteractionsImpl implements EKonnectInteractions {
  @override
  Future<void> saveInteraction(InteractionModel interactionModel) async {
    var interactionsBox = await Hive.openBox("EkonnectInteractions");
    return await interactionsBox.add(interactionModel);
  }

  @override
  Future<List<InteractionModel>> getInteractions() async {
    var interactionsBox = await Hive.openBox("EkonnectInteractions");

    final listsObject = interactionsBox.toMap();
    List<InteractionModel> interactionModel = listsObject.values.toList();
    print(interactionModel[0]);
    return interactionModel;
  }

  @override
  Future<void> saveCountries(List<CountriesModel> countries) async {
    var countriesBox = await Hive.openBox("EkonnectCountries");
    countries.map((country) {
      countriesBox.add(country);
    });
  }

  @override
  Future<List<CountriesModel>> getCountries() async {
    var countriesBox = await Hive.openBox("EkonnectCountries");
    final countriesObject = countriesBox.toMap();
    List<CountriesModel> countries = countriesObject.values.toList();
    return countries;
  }

  @override
  Future<CountriesModel> getCountry(String country) async {
    var countriesBox = await Hive.openBox("EkonnectCountries");
    final countryObject = countriesBox.get(country);
    return countryObject;
  }
}
