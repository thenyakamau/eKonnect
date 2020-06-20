import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("InteractionsTable")
class EKonnectInteractionsTable extends Table {
  TextColumn get date => text().withLength(min: 1, max: 50)();
  TextColumn get from_contact => text().withLength(min: 1, max: 50)();
  TextColumn get to_contact => text().withLength(min: 1, max: 50)();
  TextColumn get location => text().withLength(min: 1, max: 50)();
  TextColumn get latitude => text().withLength(min: 1, max: 50)();
  TextColumn get longtitude => text().withLength(min: 1, max: 50)();
}
