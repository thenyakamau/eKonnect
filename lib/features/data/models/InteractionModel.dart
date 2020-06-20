import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/Interactions.dart';

part 'InteractionModel.g.dart';

@JsonSerializable()
class InteractionModel extends Interaction {
  final String date;

  final String from_contact;

  final String to_contact;

  final String location;

  final String latitude;

  final String longtitude;

  InteractionModel({
    @required this.date,
    @required this.from_contact,
    @required this.to_contact,
    @required this.location,
    @required this.latitude,
    @required this.longtitude,
  }) : super(
          date: date,
          from_contact: from_contact,
          to_contact: to_contact,
          location: location,
          latitude: latitude,
          longtitude: longtitude,
        );

  factory InteractionModel.fromJson(Map<String, dynamic> json) =>
      _$InteractionModelFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionModelToJson(this);
}
