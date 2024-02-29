import 'package:json_annotation/json_annotation.dart';

part 'timeslot_request.g.dart';

@JsonSerializable()
class TimeSlotRequest {
  int tourId;
  int contractId;
  String travelDate;
  int tourOptionId;
  int transferId;

  TimeSlotRequest({
    required this.tourId,
    required this.contractId,
    required this.travelDate,
    required this.tourOptionId,
    required this.transferId,
  });

  factory TimeSlotRequest.fromJson(Map<String, dynamic> json) => _$TimeSlotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotRequestToJson(this);
}
