import 'package:eKonnect/features/data/models/InteractionModel.dart';
import 'package:hive/hive.dart';

abstract class EKonnectInteractions {
  Future<void> saveInteraction(InteractionModel interactionModel);
  Future<List<InteractionModel>> getInteractions();
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
    return interactionsBox.get(interactionModel);
  }
}
