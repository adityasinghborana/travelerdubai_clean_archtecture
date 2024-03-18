// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotRequest _$TimeSlotRequestFromJson(Map<String, dynamic> json) =>
    TimeSlotRequest(
      tourId: json['tourId'] as int,
      contractId: json['contractId'] as int,
      travelDate: json['travelDate'] as String,
      tourOptionId: json['tourOptionId'] as int,
      transferId: json['transferId'] as int,
    );

Map<String, dynamic> _$TimeSlotRequestToJson(TimeSlotRequest instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'contractId': instance.contractId,
      'travelDate': instance.travelDate,
      'tourOptionId': instance.tourOptionId,
      'transferId': instance.transferId,
    };
