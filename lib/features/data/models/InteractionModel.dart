import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/Interactions.dart';

part 'InteractionModel.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class InteractionModel extends Interaction {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String from_contact;
  @HiveField(2)
  final String to_contact;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final String latitude;
  @HiveField(5)
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
