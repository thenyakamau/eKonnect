import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Interaction extends Equatable {
  final String date;
  final String from_contact;
  final String to_contact;
  final String location;
  final String latitude;
  final String longtitude;

  Interaction({
    @required this.date,
    @required this.from_contact,
    @required this.to_contact,
    @required this.location,
    @required this.latitude,
    @required this.longtitude,
  });
  @override
  List<Object> get props => [
        date,
        from_contact,
        to_contact,
        location,
        latitude,
        longtitude,
      ];
}
