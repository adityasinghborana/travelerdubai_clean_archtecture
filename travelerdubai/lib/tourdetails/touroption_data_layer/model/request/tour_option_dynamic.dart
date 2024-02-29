import 'package:json_annotation/json_annotation.dart';

part 'tour_option_dynamic.g.dart';


@JsonSerializable()
class TourOptionDynamicRequest {
  int tourId;
  int contractId;
  String travelDate;
  int noOfAdult;
  int noOfChild;
  int noOfInfant;

  TourOptionDynamicRequest({
    required this.tourId,
    required this.contractId,
    required this.travelDate,
    required this.noOfAdult,
    required this.noOfChild,
    required this.noOfInfant,
  });

  factory TourOptionDynamicRequest.fromJson(Map<String, dynamic> json) =>
      _$TourOptionDynamicRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionDynamicRequestToJson(this);
}