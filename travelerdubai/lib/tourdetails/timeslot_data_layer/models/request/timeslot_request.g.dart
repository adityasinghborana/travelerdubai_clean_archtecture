// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotRequest _$TimeSlotRequestFromJson(Map<String, dynamic> json) =>
    TimeSlotRequest(
      tourId: (json['tourId'] as num).toInt(),
      contractId: (json['contractId'] as num).toInt(),
      travelDate: json['travelDate'] as String,
      tourOptionId: (json['tourOptionId'] as num).toInt(),
      transferId: (json['transferId'] as num).toInt(),
      isVendor: json['isVendor'] as bool,
    );

Map<String, dynamic> _$TimeSlotRequestToJson(TimeSlotRequest instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'contractId': instance.contractId,
      'travelDate': instance.travelDate,
      'tourOptionId': instance.tourOptionId,
      'transferId': instance.transferId,
      'isVendor': instance.isVendor,
    };
